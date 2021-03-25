import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/pages/Offers.dart';
import 'package:getx_app/src/pages/Orders.dart';
import 'package:getx_app/src/pages/PickUp.dart';
import 'package:getx_app/src/pages/Search.dart';
import 'package:getx_app/src/pages/Home.dart';

class HomeController extends GetxController {
  // final Rx<GlobalKey<State<StatefulWidget>>> bottomSheetKey = GlobalKey().obs;
  final UserController userController = Get.find();
  RxInt currentIndex = 0.obs;
  final List<Map> navBarItemsMap = [
    {'label': 'home', 'page': Home(), 'icon': Icons.home_outlined},
    {'label': 'pickup', 'page': PickUp(), 'icon': Icons.directions_run_sharp},
    {'label': 'offers', 'page': Offers(), 'icon': Icons.local_offer_outlined},
    {'label': 'search', 'page': Search(), 'icon': Icons.search},
    {'label': 'orders', 'page': Orders(), 'icon': Icons.bookmark_border},
  ];

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
