import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/pickup_google_map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickupGoogleMap extends StatefulWidget {
  @override
  _PickupGoogleMapState createState() => _PickupGoogleMapState();
}

class _PickupGoogleMapState extends State<PickupGoogleMap> {
  PickupGoogleMapController pickupGoogleMapController; // = Get.put(PickupGoogleMapController());
  @override
  void initState() {
    pickupGoogleMapController = Get.put(PickupGoogleMapController(update));

    super.initState();
  }

  update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        child: GoogleMap(
          markers: pickupGoogleMapController.markers,
          mapType: MapType.hybrid,
          initialCameraPosition: pickupGoogleMapController.getInitialCameraPosition,
          onMapCreated: (_) => pickupGoogleMapController.googleMapController.complete(_),
          myLocationEnabled: true,
        ),
      ),
    );
  }
}
