import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/login_controller.dart';
import 'package:getx_app/src/items/button_widget.dart';
import 'package:getx_app/src/items/textfield_widget.dart';
import 'package:getx_app/src/pages/signup.dart';

import '../images_path.dart';

class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

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
            TextFieldWidget(
              loginController.emailTextEditingController,
              hintText: 'email'.tr,
            ),
            SizedBox(height: 15),
            TextFieldWidget(
              loginController.passwordTextEditingController,
              hintText: 'password'.tr,
            ),
            SizedBox(height: 20),
            ButtonWidget(
              'login'.tr,
              function: () {
                loginController.loginUser();
              },
            ), SizedBox(height: 20),
            ButtonWidget(
              'guest'.tr,
              fontColor: Colors.black,
              btnColor: Constants.GREY_COLOR,
              function: () {
                loginController.loginAsGuest();
              },
            ),

            // ButtonWidget('Login as Guest')
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('not_a_user'.tr+'? '),
              GestureDetector(
                onTap: ()=>Get.to(SignUp()),
                child: Text('sign_up'.tr,
                    textScaleFactor: 1.1,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ])
          ],
        ),
      ),
    ))));
  }
}
