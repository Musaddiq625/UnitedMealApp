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
  }
}
