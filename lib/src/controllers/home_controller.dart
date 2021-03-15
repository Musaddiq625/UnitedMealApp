import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/pages/Offers.dart';
import 'package:getx_app/src/pages/Orders.dart';
import 'package:getx_app/src/pages/PickUp.dart';
import 'package:getx_app/src/pages/Search.dart';
import 'package:getx_app/src/pages/Home.dart';
import 'package:getx_app/src/pages/login.dart';

class HomeController extends GetxController {
  // final Rx<GlobalKey<State<StatefulWidget>>> bottomSheetKey = GlobalKey().obs;
  RxInt currentIndex = 0.obs;
  final List<Map> navBarItemsMap = [
    {'label': 'home', 'page': Home(), 'icon': Icons.home_outlined},
    {'label': 'pickup', 'page': PickUp(), 'icon': Icons.directions_run_sharp},
    {'label': 'offers', 'page': Offers(), 'icon': Icons.local_offer_outlined},
    {'label': 'search', 'page': Search(), 'icon': Icons.search},
    {'label': 'orders', 'page': Orders(), 'icon': Icons.bookmark_border},
  ];

  changeIndex(int index) => currentIndex.value = index;

  Future<bool> onBackButtonPressed() async {
    // return currentIndex.value == 0 ? true : currentIndex.value = 0;
    if (currentIndex.value != 0) {
      currentIndex.value = 0;
      return false;
    } else {
      return Get.defaultDialog(
          title: '',
          titleStyle: TextStyle(fontSize: 1),
          content: Container(
            child: Text(
              'Are you sure you want\nto Logout?',
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            TextButton(
                child: Text('Logout', textScaleFactor: 1.2), onPressed: () => Get.offAll(Login())),
            TextButton(child: Text('Cancel', textScaleFactor: 1.2), onPressed: () => Get.back()),
          ]);
    }
  }
}
