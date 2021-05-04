import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/user_controller.dart';

import 'package:getx_app/src/utils/utilities.dart';

import 'food_controller.dart';

class HomeController extends GetxController {
  HomeController(){
    // setUserLocation();
  }
  RxList activeCuisines = [].obs;
  selectCuisine(newName) {
    if (activeCuisines.contains(newName)) {
      activeCuisines.remove(newName);
    } else
      activeCuisines.add(newName);
  }
  final FoodController foodController = Get.find();
  getCuisines() => foodController.firebaseFunctions.getAllCuisines();
  // final Rx<GlobalKey<State<StatefulWidget>>> bottomSheetKey = GlobalKey().obs;0
  final UserController userController = Get.find();
  Utilities utilities = Utilities();
  Future setUserLocation()async{
    await utilities.determinePosition().then((value) {
      userController.user.value.latitude = value.latitude;
      userController.user.value.longitude = value.longitude;
    });
  }
  RxInt currentIndex = 0.obs;

  changeIndex(int index) => currentIndex.value = index;

  // ignore: missing_return
  Future<bool> onBackButtonPressed() async {
    // return currentIndex.value == 0 ? true : currentIndex.value = 0;
    if (currentIndex.value != 0) {
      currentIndex.value = 0;
      return false;
    } else {
      userController.logoutUserDialog();

    }
  }
}
