import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_app/models/cart.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/user.dart';
import 'package:getx_app/src/controllers/cart_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  String _loggedInUser = 'logged_in_user';
  String _savedCartItems = 'cart_items';
  final CartController cartController = Get.find();

  Future setLoginDetails(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_loggedInUser, jsonEncode(user.toMap()));
  }

  Future get getLoginDetails async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_loggedInUser);
  }

  Future clearLoginDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(_loggedInUser);
  }

  Future updateCartItems(List<Cart> cartItems) async {
    List tempList = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for (int i = 0; i < cartItems.length; i++) tempList.add(cartItems[i].toMap());
    sharedPreferences.setString(_savedCartItems, jsonEncode(tempList));
  }

  Future updateCartItemsInSharedPref() async {
    List<Cart> cartItems = [];
    List tempList = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    tempList = jsonDecode(sharedPreferences.getString(_savedCartItems));
    for (int i = 0; i < tempList.length; i++)
      cartItems.add(
        Cart(
          id: tempList[i]['id'],
          comment: tempList[i]['comment'],
          quantity: tempList[i]['quantity'],
          food: Food(
            id: tempList[i]['food']['id'],
            name: tempList[i]['food']['name'],
            price: tempList[i]['food']['price'],
            availableQuantity: tempList[i]['food']['available_quantity'],
            imagePath: tempList[i]['food']['imagePath'],
            deliveryTimeInMin: tempList[i]['food']['deliveryTimeInMin'],
            cuisine: tempList[i]['food']['cuisine'],
            deliveryType: tempList[i]['food']['deliveryType'],
            restaurantName: tempList[i]['food']['restaurantName'],
            totalRatings: tempList[i]['food']['totalRatings'],
          ),
        ),
      );
    for (int j = 0; j < cartItems.length; j++) cartController.cartItems.add(cartItems[j]);
  }
  Future clearCartItemsInSharedPref()async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(_savedCartItems);

  }
}
