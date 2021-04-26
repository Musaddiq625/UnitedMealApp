import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/items/button_widget.dart';
import 'package:getx_app/src/items/textfield_widget.dart';
import 'package:getx_app/src/pages/signup.dart';

import '../images_path.dart';

class Login extends StatelessWidget {

  final UserController userController = Get.find();

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
                TextFieldWidget(
                  userController.signInEmailTextEditingController,
                  hintText: 'email'.tr,
                ),
                SizedBox(height: 15),
                Obx(() => TextFieldWidget(userController.signInPasswordTextEditingController,
                    hintText: 'password'.tr,
                    isObscure: userController.getLoginPasswordObscure,
                    isPasswordField: true,
                    onPressed: () => userController
                        .switchLoginPasswordObscure(!userController.getLoginPasswordObscure))),
                SizedBox(height: 20),
                ButtonWidget(
                  'login'.tr,
                  function: () {
                    userController.loginUser(userController.signInEmailTextEditingController.text,
                        userController.signInPasswordTextEditingController.text);
                  },
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  'guest'.tr,
                  fontColor: Colors.black,
                  btnColor: Constants.GREY_COLOR,
                  function: () {
                    userController.loginAsGuest();
                  },
                ),
                SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('not_a_user'.tr + '? '),
                  GestureDetector(
                    onTap: () => Get.to(SignUp()),
                    child: Text('sign_up'.tr,
                        textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ])
              ],
            ),
          ),
        )),
        Obx(()=>!userController.isLoading.value
            ? Container()
            : Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(.5),
            child: CircularProgressIndicator()))
      ],
    )));
  }
}
