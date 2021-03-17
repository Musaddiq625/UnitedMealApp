import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/user.dart';
import 'package:getx_app/src/pages/login.dart';

class UserController extends GetxController {
  User user;

  Future logOutUser() async => user = User(isGuest: false);

  Future checkIsLoggedIn() async {
    if (user.isGuest) {
      Get.defaultDialog(
          title: '',
          titleStyle: TextStyle(fontSize: 1),
          content: Container(
            child: Text(
              'please_login_first_to_continue'.tr,
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            TextButton(
                child: Text('Login', textScaleFactor: 1.2), onPressed: () => Get.offAll(Login())),
            TextButton(child: Text('Cancel', textScaleFactor: 1.2), onPressed: () => Get.back()),
          ]);
      // logOutUser();
    }else  Get.defaultDialog(
        title: '',
        titleStyle: TextStyle(fontSize: 1),
        content: Container(
          child: Text(
            'Hello logged in User'.tr,
            textAlign: TextAlign.center,
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          TextButton(child: Text('Okay', textScaleFactor: 1.2), onPressed: () => Get.back()),
        ]);
  }

  Future logoutUserDialog() async {
    if (user.isGuest)
      Get.offAll(Login());
    else
      Get.defaultDialog(
          title: '',
          titleStyle: TextStyle(fontSize: 1),
          content: Container(
            child: Text(
              'are_you_sure_you_want_to_logout'.tr,
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            TextButton(
                child: Text('logout'.tr, textScaleFactor: 1.2),
                onPressed: () => Get.offAll(Login())),
            TextButton(child: Text('Cancel', textScaleFactor: 1.2), onPressed: () => Get.back()),
          ]);
  }
}
