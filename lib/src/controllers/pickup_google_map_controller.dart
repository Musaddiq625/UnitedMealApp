import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickupGoogleMapController extends GetxController {
  RxSet<Marker> markers = <Marker>{}.obs;
  PickupGoogleMapController(){

    _getRestaurants();

  }
RxList<Restaurant> restaurantsList = <Restaurant>[].obs;
  final Completer<GoogleMapController> googleMapController = Completer();
  final FirebaseFunctions _firebaseFunctions =FirebaseFunctions();
  static final CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  get getInitialCameraPosition=>_initialCameraPosition;

  static const LatLng _center = const LatLng(45.521563, -122.677433);
  // LatLng _lastMapPosition = _center;
  //
  // void _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }
  _getRestaurants(){
    print('_getRestaurants');
    _firebaseFunctions.getAllRestaurantsWithFoodsStream2().listen((QuerySnapshot  streamSubscription){
      for(int i=0;i<streamSubscription.docs.length;i++)
        restaurantsList.add(Restaurant(id: streamSubscription.docs[i].data()['id'], name: streamSubscription.docs[i].data()['name'],imagePath: streamSubscription.docs[i].data()['image'],
            latitude: streamSubscription.docs[i].data()['geopoint'].latitude,longitude: streamSubscription.docs[i].data()['geopoint'].longitude,
            ratings:streamSubscription.docs[i].data()['ratings'],address: streamSubscription.docs[i].data()['address']));

      _setMarkers(restaurantsList);


    });
  }

  _setMarkers(List<Restaurant> _restaurantsList){
    for(int i=0;i<_restaurantsList.length;i++) {
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
    }
    print('_markers');
    print(markers);
  }
  // get getMarkers =>markers;
}
