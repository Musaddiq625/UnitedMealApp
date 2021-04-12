import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/user.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/items/button_widget.dart';
import 'package:getx_app/src/items/textfield_widget.dart';

import '../images_path.dart';

class SignUp extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        SingleChildScrollView(
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
                TextFieldWidget(userController.nameTextEditingController, hintText: 'name'.tr),
                SizedBox(height: 15),
                TextFieldWidget(userController.emailTextEditingController, hintText: 'email'.tr),
                SizedBox(height: 15),
                TextFieldWidget(userController.passwordTextEditingController,
                    hintText: 'password'.tr),
                SizedBox(height: 15),
                TextFieldWidget(userController.rePasswordTextEditingController,
                    hintText: 're_password'.tr),
                SizedBox(height: 15),
                TextFieldWidget(userController.addressTextEditingController,
                    hintText: 'address'.tr),
                SizedBox(height: 20),
                ButtonWidget(
                  'register'.tr,
                  function: () {
                    User user = User(
                        name: userController.nameTextEditingController.text,
                        email: userController.emailTextEditingController.text,
                        password: userController.passwordTextEditingController.text,
                        address: userController.addressTextEditingController.text);
                    if (userController.nameTextEditingController.text == '' ||
                        userController.emailTextEditingController.text == '' ||
                        userController.rePasswordTextEditingController.text == '' ||
                        userController.passwordTextEditingController.text == '' ||
                        userController.addressTextEditingController.text == '') print('Enter in all fields to continue');
                    else print('continue');
                    userController.signUpUser(
                        user,
                        (userController.nameTextEditingController.text == '' ||
                            userController.emailTextEditingController.text == '' ||
                            userController.rePasswordTextEditingController.text == '' ||
                            userController.passwordTextEditingController.text == '' ||
                            userController.addressTextEditingController.text == ''),
                        userController.rePasswordTextEditingController.text

                    );
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
        )),
        !userController.isLoading.value
            ? Container()
            : Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.grey.withOpacity(.5),
                child: CircularProgressIndicator())
      ],
    )));
  }
}
