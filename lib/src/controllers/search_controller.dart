import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  // RxList<String> searchTypesList =
  //     ['stores'.toString().tr + '(50)', 'items'.toString().tr + '(3)'].obs;
  static RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController(initialPage: selectedIndex.value);

  changePageControllerValue(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
