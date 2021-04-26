import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/database/shared_pref.dart';
import 'package:getx_app/models/user.dart';
import 'package:getx_app/src/dashboard.dart';
import 'package:getx_app/src/pages/login.dart';
import 'package:getx_app/src/utils/utilities.dart';

class UserController extends GetxController {
  User user = User();
  FirebaseFunctions firebaseFunctions = FirebaseFunctions();
  Utilities utilities = Utilities();
  RxBool isLoading = false.obs, _loginPasswordObscure = true.obs, _signUpPasswordObscure = true.obs;

  final TextEditingController signInEmailTextEditingController = TextEditingController();
  final TextEditingController signInPasswordTextEditingController = TextEditingController();

  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController signUpEmailTextEditingController = TextEditingController();
  final TextEditingController signUpPasswordTextEditingController = TextEditingController();
  final TextEditingController signUpRePasswordTextEditingController = TextEditingController();
  final TextEditingController phoneNoTextEditingController = TextEditingController();
  final TextEditingController addressTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();

  get getLoginPasswordObscure => _loginPasswordObscure.value;

  get getSignUpPasswordObscure => _signUpPasswordObscure.value;

  switchLoginPasswordObscure(bool value) => _loginPasswordObscure.value = value;

  switchSignUpPasswordObscure(bool value) => _signUpPasswordObscure.value = value;

  _clearSignInTextFields() {
    signInEmailTextEditingController.clear();
    signInPasswordTextEditingController.clear();
  }
    _clearSignUpTextFields() {

      signUpPasswordTextEditingController.clear();
      nameTextEditingController.clear();
      signUpEmailTextEditingController.clear();
      signUpRePasswordTextEditingController.clear();
      phoneNoTextEditingController.clear();
      addressTextEditingController.clear();
    }

    Future logOutUser() async {
      MySharedPref().clearLoginDetails();
      MySharedPref().clearCartItemsInSharedPref();
      _clearSignInTextFields();
      user = User(isGuest: true);
      print('loggging out');
      Get.offAll(()=>Login());
    }

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
                  onPressed: () {
                    logOutUser();
                    Get.offAll(Login());
                  }),
              TextButton(child: Text('Cancel', textScaleFactor: 1.2), onPressed: () => Get.back()),
            ]);
    }

    Future signUpUser(User user, bool isNull, String rePass) async {
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
              _clearSignUpTextFields();
              isLoading.value = false;
            });
          } else {
            utilities.mySnackBar('error'.tr, 'error_sign_up'.tr);
            isLoading.value = false;
          }
        });
      }
    }

    Future loginAsGuest() async {
      user = User(isGuest: true);
      Get.to(() => Dashboard());
    }

    loginUser(String email, String password) async {
      if (email == '' || password == '')
        utilities.mySnackBar('error'.tr, 'error_please_fill'.tr);
      else {
        isLoading.value = true;
        firebaseFunctions.login(email, password).then((value) {
          if (value != '') {
            var _value = jsonDecode(value);
            User _user = User(
              id: _value['id'],
              name: _value['name'],
              email: _value['email'],
              phoneNo: _value['phoneNo'],
              address: _value['address'],
            );

            isLoading.value = false;
            user = _user;
            MySharedPref().setLoginDetails(_user);

            return Get.to(() => Dashboard());
          } else {
            isLoading.value = false;
            utilities.mySnackBar('error'.tr, 'error_password'.tr);
          }
        });
      }
    }
  }

