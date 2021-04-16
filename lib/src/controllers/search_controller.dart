import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';

class SearchController extends GetxController {
  SearchController() {
    _getTotal();
    // _getData();
  }

  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();
  RxInt _selectedIndex = 0.obs;

  get getSelectedIndex => _selectedIndex.value;

  set setSelectedIndex(int index) => _selectedIndex.value = index;
  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController storesTextFieldController = TextEditingController();
  final TextEditingController itemsTextFieldController = TextEditingController();
  RxList storesSearchList = [].obs, itemsSearchList = [].obs;
  RxList storesSearchListResult = [].obs, itemsSearchListResult = [].obs;
  RxBool _storesNotFound = false.obs, _itemsNotFound = false.obs;
  RxInt _totalStores = 0.obs, _totalItems = 0.obs;

  get getTotalStores => _totalStores.value;

  get getTotalItems => _totalItems.value;

  get getStores => storesSearchList;

  get getItems => itemsSearchList;

  _getTotal() async {
    _totalItems.value = await firebaseFunctions.getAllFoodsTotal();
    _totalStores.value = await firebaseFunctions.getAllRestaurantsTotal();
  }

  // _getData() async {
  //   print('get data');
  //   await firebaseFunctions
  //       .getAllRestaurantsWithFoodsStream()
  //       .toList()
  //       .then((List<QuerySnapshot> value) {
  //     for (int i = 0; i < value.length; i++) {
  //       print("value[$i].docs");
  //       print(value[i].docs);
  //     }
  //     print("value[0].docs[0]");
  //     print(value[0].docs[0]);
  //   });
  //   itemsSearchList.assignAll(await firebaseFunctions.getAllFoodsStream().toList());
  // }

  changePageControllerValue(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  onSearchStores(String searchText, List dataList) {
    if (searchText == '') {
      storesSearchListResult.clear();
      _storesNotFound.value = false;
    } else {
      List tempList = [];
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i]['name'].toString().toLowerCase().contains(searchText.toLowerCase())) {
          if (!tempList.contains(dataList[i])) tempList.add(dataList[i]);
          print('found');
        }
      }
      if (tempList.isEmpty) {
        storesSearchListResult.clear();
        _storesNotFound.value = true;
      } else {
        storesSearchListResult.assignAll(tempList);
      }
      // if (_resultList.isEmpty) _notFound.value = true;
    }
  }

  onSearchItems(String searchText, List dataList) {
    if (searchText == '') {
      itemsSearchListResult.clear();
      _itemsNotFound.value = false;
    } else {
      List tempList = [];
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i]['name'].toString().toLowerCase().contains(searchText.toLowerCase())) {
          if (!tempList.contains(dataList[i] )) {
            print('dataList[$i]');
            print(dataList[i]);
            tempList.add(dataList[i]);
          }
          print('found');
        }
      }
      if (tempList.isEmpty) {
        itemsSearchListResult.clear();
        _itemsNotFound.value = true;
      } else {
        itemsSearchListResult.assignAll(tempList);
      }
      // if (_resultList.isEmpty) _notFound.value = true;
    }
  }
}
