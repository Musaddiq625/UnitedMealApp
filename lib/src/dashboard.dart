import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/home_controller.dart';

import 'const.dart';
import 'pages/account_bottomsheet.dart';

class Dashboard extends StatelessWidget {
  final  homeController = Get.put(HomeController());
  final GlobalKey<ExpandableBottomSheetState> bottomSheetKey = new GlobalKey();

  BottomNavigationBarItem bottomNavItem(index) => BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        // ignore: deprecated_member_use
        title: Text(homeController.navBarItemsMap[index]['label'].toString().tr,
            style: TextStyle(
                color: homeController.currentIndex.value == index
                    ? Constants.APP_COLOR
                    : Colors.grey)),
        icon: Icon(
          homeController.navBarItemsMap[index]['icon'],
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
                    () => homeController.navBarItemsMap[homeController.currentIndex.value]['page']),
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
