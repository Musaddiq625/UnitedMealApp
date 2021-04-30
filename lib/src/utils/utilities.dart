import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Utilities {
  static Future<bool> isInternetConnected() async {
    try {
      return await InternetAddress.lookup('www.google.com.pk')
          .then((response) => response.isNotEmpty);
    } catch (e) {
      return false;
    }
  }

  mySnackBar(String title, String body) {
    return Get.snackbar(title, body, snackPosition: SnackPosition.BOTTOM);
  }

  Future<Position> determinePosition() async {
    print('GETTINGGG LOCATIONNN!!!');
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  List<Map<String, dynamic>> getNearbyRestaurants(List restaurantLatLng, LatLng userLatLng) {
    // final UserController userController = Get.find();



      // if(userLatLng.latitude == null || userLatLng.longitude ==null)
      //   {
      //     return restaurantLatLng;
      //   }
      // else {
      //   List<Map<String, dynamic>> tempList = [];
      //   List<double> distanceList = [];
      //
      //   for (int i = 0; i < restaurantLatLng.length; i++) tempList.add(restaurantLatLng[i].data());
      //   for (int i = 0; i < tempList.length; i++) {
      //     distanceList.add(Geolocator.distanceBetween(tempList[i]['geopoint'].latitude,
      //         tempList[i]['geopoint'].longitude,userLatLng.latitude, userLatLng.longitude));
      //     tempList[i]['distance'] = distanceList[i];
      //   }
      //   tempList.sort((a, b) => a['distance'].compareTo(b['distance']));
      //   return tempList;
      // }

    List<Map<String, dynamic>> tempList = [];
    List<double> distanceList = [];

    for (int i = 0; i < restaurantLatLng.length; i++) tempList.add(restaurantLatLng[i].data());
    for (int i = 0; i < tempList.length; i++) {
      distanceList.add(Geolocator.distanceBetween(tempList[i]['geopoint'].latitude,
          tempList[i]['geopoint'].longitude, 24.9045195, 67.0756364));
      tempList[i]['distance'] = distanceList[i];
    }
    tempList.sort((a, b) => a['distance'].compareTo(b['distance']));
    return tempList;
  }
}
