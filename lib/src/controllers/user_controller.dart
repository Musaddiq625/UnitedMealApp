import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/user.dart';
import 'package:getx_app/src/dashboard.dart';
import 'package:getx_app/src/pages/login.dart';
import 'package:getx_app/src/utils/utilities.dart';

class UserController extends GetxController {
  User user;
  FirebaseFunctions firebaseFunctions = FirebaseFunctions();
  Utilities utilities = Utilities();
  RxBool isLoading = false.obs;

  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final rePasswordTextEditingController = TextEditingController();
  final phoneNoTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();

  _clearTextFields() {
    nameTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    rePasswordTextEditingController.clear();
    phoneNoTextEditingController.clear();
    addressTextEditingController.clear();
  }

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
    } else
      Get.defaultDialog(
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

  Future signUpUser(User user, bool isNull, String rePass) async {
    print('isNull $isNull');
    print(user.toMap());
    if (isNull)
      utilities.mySnackBar('error'.tr, 'error_please_fill'.tr);
    else if (user.password != rePass)
      utilities.mySnackBar('error'.tr, 'error_pw_not_matched'.tr);
    else {
      isLoading.value = true;
      firebaseFunctions.signUp(user).then((value) {
        if (value) {
          utilities.mySnackBar('success'.tr, 'successfully_signed_up'.tr);
          Future.delayed(Duration(seconds: 1)).then((value) {
            Get.back();
            Get.back();
            _clearTextFields();
            isLoading.value = false;
          });
        } else {
          utilities.mySnackBar('error'.tr, 'error_sign_up'.tr);
          isLoading.value = false;
        }
      });
    }
  }

  loginUser(String email, String password) async {
    if (email == '' || password == '')
      utilities.mySnackBar('error'.tr, 'error_please_fill'.tr);
    else
      firebaseFunctions.login(email, password).then((value) => Get.to(() => Dashboard()));
  }
}
