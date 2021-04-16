import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/shared_pref.dart';
import 'package:getx_app/models/user.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/cart_controller.dart';
import 'package:getx_app/src/controllers/food_controller.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/dashboard.dart';
import 'package:getx_app/src/images_path.dart';

import 'get_started.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController userController = Get.put(UserController());
  final CartController cartController = Get.put(CartController());
  final FoodController foodController = Get.put(FoodController());
  toNextScreenWithDelay() {
    Widget page;
    MySharedPref().getLoginDetails.then((getLoginDetailsValue) {
      if(getLoginDetailsValue == null)
        page = GetStartedPage();
      else {
        var _value = jsonDecode(getLoginDetailsValue);
        User _user = User(
          id: _value['id'],
          name: _value['name'],
          email: _value['email'],
          phoneNo: _value['phoneNo'],
          address: _value['address'],
        );userController.user = _user;
        page = Dashboard();
      }
      MySharedPref().updateCartItemsInSharedPref();
      Future.delayed(Duration(seconds: 2))
          .then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => page)));
    });

  }

  @override
  void initState() {
    toNextScreenWithDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                alignment: Alignment.center,
                child: Image.asset(
                  ImagesPath.appLogoImage,
                  filterQuality: FilterQuality.low,
                ),
              ),
              SizedBox(height: 15),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Constants.APP_COLOR))
            ],
          ),
        ),
      ),
    );
  }
}
