import 'package:ecommerce_app/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: SignInScreen(
          providers: controller.providers,
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) {
              Get.offNamed(Routes.BASE);
            }),
          ],
        ),
      ),
    );
  }

}