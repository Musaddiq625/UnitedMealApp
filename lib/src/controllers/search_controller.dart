import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  get getSelectedIndex => _selectedIndex.value;
  set setSelectedIndex(int index) => _selectedIndex.value = index ;
  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController storesTextFieldController = TextEditingController();
  final TextEditingController itemsTextFieldController = TextEditingController();
  RxList storesSearchListResult = [].obs,itemsSearchListResult = [].obs;
  changePageControllerValue(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
