import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/utils/utilities.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickupGoogleMapController extends GetxController {
  static final UserController userController =Get.find();
  Utilities utilities = Utilities();
  LocationPermission permission;
  RxSet<Marker> markers = <Marker>{}.obs;
  RxList<Restaurant> restaurantsList = <Restaurant>[].obs;
  final FirebaseFunctions _firebaseFunctions = FirebaseFunctions();
  final Completer<GoogleMapController> googleMapController = Completer();
  static final LatLng _tempLatLng = LatLng(37.42796133580664, -122.085749655962);
  static Rx<Position> currentPosition =
      Position(longitude: _tempLatLng.longitude, latitude: _tempLatLng.latitude).obs;

  // static final Rx<CameraPosition> _initialCameraPosition = CameraPosition(
  //         target: LatLng(currentPosition.value.latitude, currentPosition.value.longitude),
  //         zoom: 14.4746)
  //     .obs;
  static final Rx<CameraPosition> _initialCameraPosition = CameraPosition(
          target: LatLng(userController.user.latitude, userController.user.longitude),
          zoom: 14.4746)
      .obs;

  get getInitialCameraPosition => _initialCameraPosition.value;

  // static const LatLng _center = const LatLng(45.521563, -122.677433);

  PickupGoogleMapController(Function updateWidget) {
    _getRestaurants(updateWidget);
    getPosition();
  }

  getPosition() async => currentPosition.value = await utilities.determinePosition();



  // LatLng _lastMapPosition = _center;
  //
  // void _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }
  _getRestaurants(Function updateWidget) {
    print('_getRestaurants');
    _firebaseFunctions
        .getAllRestaurantsWithFoodsStream2()
        .listen((QuerySnapshot streamSubscription) {
      for (int i = 0; i < streamSubscription.docs.length; i++)
        restaurantsList.add(Restaurant(
            id: streamSubscription.docs[i].data()['id'],
            name: streamSubscription.docs[i].data()['name'],
            imagePath: streamSubscription.docs[i].data()['image'],
            latitude: streamSubscription.docs[i].data()['geopoint'].latitude,
            longitude: streamSubscription.docs[i].data()['geopoint'].longitude,
            ratings: double.parse(streamSubscription.docs[i].data()['ratings'].toString()),
            address: streamSubscription.docs[i].data()['address']));

      _setMarkers(restaurantsList,updateWidget);
    });
  }

  _setMarkers(List<Restaurant> _restaurantsList,Function updateWidget) {
    for (int i = 0; i < _restaurantsList.length; i++) {
      print('setting marker $i');
      markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: LatLng(_restaurantsList[i].latitude, _restaurantsList[i].longitude),
        infoWindow: InfoWindow(
          title: _restaurantsList[i].name,
          snippet: _restaurantsList[i].ratings.toString(),
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      updateWidget();
    }
    print('_markers');
    print(markers);
  }
// get getMarkers =>markers;
}
