import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/dashboard.dart';

class LoginController extends GetxController {
  final UserController userController = Get.put(UserController());
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  Future loginUser() async {
    Get.to(()=>Dashboard());
    // try {
    //   if (emailTextEditingController.text == '' || passwordTextEditingController.text == '') {
    //     Get.snackbar('Error', 'Enter in all fields to continue');
    //   } else if (emailTextEditingController.text == 'admin' &&
    //       passwordTextEditingController.text == 'admin') {
    //
    //     userController.user = User(name: emailTextEditingController.text, email: emailTextEditingController.text);
    //     Get.to(Dashboard());
    //     print('LOGIN SUCCESSFUL');
    //     return true;
    //   } else {
    //     print('LOGIN FAILED');
    //     return false;
    //   }
    // } catch (e) {
    //   print('CATCHING ERROR: $e');
    // }
  }
}
