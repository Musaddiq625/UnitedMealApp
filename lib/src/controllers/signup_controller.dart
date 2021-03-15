import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/pages/login.dart';

class SignUpController extends GetxController {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final rePasswordTextEditingController = TextEditingController();
  final phoneNoTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();

  Future signUpUser() async {
    Get.to(Login(),duration: Duration(milliseconds: 800));
    // try {
    //   if (emailTextEditingController.text == '' || passwordTextEditingController.text == '') {
    //     Get.snackbar('Error', 'Enter in all fields to continue');
    //   } else if (emailTextEditingController.text == 'admin' &&
    //       passwordTextEditingController.text == 'admin') {
    //     user = User(name: emailTextEditingController.text, email: emailTextEditingController.text);
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
