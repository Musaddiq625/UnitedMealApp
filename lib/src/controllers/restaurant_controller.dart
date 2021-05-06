import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/utils/utilities.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantController extends GetxController {
  RxList<Food> foodsList = <Food>[].obs;

  RestaurantController(String restaurantName) {
    firebaseFunctions.getRestaurantFoods(restaurantName).then((value) {
      // print('value.docs[0].data()');
      // print(value.docs[0].data());
      if (value.docs.length > 0)
        for (int i = 0; i < value.docs.length; i++) {
          foodsList.add(Food(
            imagePath: value.docs[i].data()['image'],
            price: double.parse(value.docs[i].data()['price'].toString()),
            name: value.docs[i].data()['name'],
            id: value.docs[i].data()['id'],
            restaurantName: value.docs[i].data()['restaurant_name'],
            restaurantId: value.docs[i].data()['restaurant_id'],
            availableQuantity: value.docs[i].data()['availableQuantity'],
          ));
        }
    });
  }

  // RxList<Restaurant> restaurantList = <Restaurant>[].obs;
  // RxList restaurantList =[].obs;
  RxInt selectedIndex = 0.obs;

  changeDeliveryType(int updatedIndex) => selectedIndex.value = updatedIndex;
  FirebaseFunctions firebaseFunctions = FirebaseFunctions();
}
