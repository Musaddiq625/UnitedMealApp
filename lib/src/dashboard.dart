import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/home_controller.dart';

import 'const.dart';
import 'pages/account_bottomsheet.dart';
import 'package:getx_app/src/pages/Offers.dart';
import 'package:getx_app/src/pages/Orders.dart';
import 'package:getx_app/src/pages/PickUp.dart';
import 'package:getx_app/src/pages/Search.dart';
import 'package:getx_app/src/pages/Home.dart';

class Dashboard extends StatelessWidget {
  static final HomeController homeController = Get.put(HomeController());
  final GlobalKey<ExpandableBottomSheetState> bottomSheetKey = new GlobalKey();
  final List<Map> navBarItemsMap = [
    {'label': 'home', 'page': Home(homeController), 'icon': Icons.home_outlined},
    {'label': 'pickup', 'page': PickUp(), 'icon': Icons.directions_run_sharp},
    {'label': 'offers', 'page': Offers(), 'icon': Icons.local_offer_outlined},
    {'label': 'search', 'page': Search(), 'icon': Icons.search},
    {'label': 'orders', 'page': Orders(), 'icon': Icons.bookmark_border},
  ];

  BottomNavigationBarItem bottomNavItem(index) => BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        // ignore: deprecated_member_use
        title: Text(navBarItemsMap[index]['label'].toString().tr,
            style: TextStyle(
                color: homeController.currentIndex.value == index
                    ? Constants.APP_COLOR
                    : Colors.grey)),
        icon: Icon(
          navBarItemsMap[index]['icon'],
          color: homeController.currentIndex.value == index ? Constants.APP_COLOR : Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: homeController.onBackButtonPressed,
        child: Scaffold(
            body: ExpandableBottomSheet(
                key: bottomSheetKey,
                background: Obx(
                    () => navBarItemsMap[homeController.currentIndex.value]['page']),
                expandableContent: Account()),
            bottomNavigationBar: Obx(() => BottomNavigationBar(
                    unselectedFontSize: 13,
                    selectedFontSize: 13,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: homeController.currentIndex.value,
                    onTap: (index) => homeController.changeIndex(index),
                    items: [
                      bottomNavItem(0),
                      bottomNavItem(1),
                      bottomNavItem(2),
                      bottomNavItem(3),
                      bottomNavItem(4),
                    ]))),
      ),
    );
  }
}
