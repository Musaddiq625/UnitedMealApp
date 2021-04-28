import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/pickup_google_map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickupGoogleMap extends StatelessWidget {

  final PickupGoogleMapController pickupGoogleMapController = Get.put(PickupGoogleMapController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        child:Obx(()=> GoogleMap(
          markers: pickupGoogleMapController.markers,
          mapType: MapType.hybrid,
          initialCameraPosition: pickupGoogleMapController.getInitialCameraPosition,
          onMapCreated: (_) => pickupGoogleMapController.googleMapController.complete(_),

        )),
      ),
    );
  }
}
