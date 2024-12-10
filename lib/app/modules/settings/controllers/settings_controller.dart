import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_theme.dart';
import '../../../data/local/my_shared_pref.dart';

class SettingsController extends GetxController {

  // get is light theme from shared pref
  var isLightTheme = MySharedPref.getThemeIsLight();

  User? user;


  @override
  void onInit() {
    getAuthUser();
    super.onInit();
  }


  /// change the system theme
  changeTheme(bool value) {
    MyTheme.changeTheme();
    isLightTheme = MySharedPref.getThemeIsLight();
    update(['Theme']);
  }


  Future<void> getAuthUser() async{
    user = FirebaseAuth.instance.currentUser;
  }

  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SIGNIN);
  }

}
