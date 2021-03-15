import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/signup_controller.dart';
import 'package:getx_app/src/items/button_widget.dart';
import 'package:getx_app/src/items/textfield_widget.dart';

import '../images_path.dart';

class SignUp extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Container(
              height: 120,
              width: 120,
              child: Image.asset(ImagesPath.appLogoImage, filterQuality: FilterQuality.low),
            ),
            SizedBox(height: 30),
            TextFieldWidget(signUpController.emailTextEditingController, hintText: 'email'.tr),
            SizedBox(height: 15),
            TextFieldWidget(signUpController.passwordTextEditingController,
                hintText: 'password'.tr),
            SizedBox(height: 15),
            TextFieldWidget(signUpController.rePasswordTextEditingController,
                hintText: 're_password'.tr),
            SizedBox(height: 15),
            TextFieldWidget(signUpController.addressTextEditingController, hintText: 'password'.tr),
            SizedBox(height: 20),
            ButtonWidget(
              'register'.tr,
              function: () {
                signUpController.signUpUser();
              },
            ),

            // ButtonWidget('Login as Guest')
            SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Have an account? '),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text('Go back',
                    textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ])
          ],
        ),
      ),
    ))));
  }
}
