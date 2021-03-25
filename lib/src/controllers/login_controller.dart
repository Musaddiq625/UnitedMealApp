import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/user.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/dashboard.dart';

class LoginController extends GetxController {
  final  userController = Get.put(UserController());
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  Future loginAsGuest()async{
    userController.user = User(isGuest: true);
    Get.to(()=>Dashboard());
  }
  Future loginUser() async {
    userController.user = User();
    Get.to(()=>Dashboard());
  }
}
