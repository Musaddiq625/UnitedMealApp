import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/controllers/food_controller.dart';
import 'package:getx_app/src/controllers/home_controller.dart';
import 'package:getx_app/src/controllers/restaurant_controller.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/pages/food_item_add_to_order.dart';
import 'package:getx_app/src/utils/utilities.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../const.dart';
import 'restaurant_widget_expanded.dart';

class NearByRestaurants extends StatelessWidget {
  NearByRestaurants(this.homeController);

  final HomeController homeController;

  final UserController userController = Get.find();

  // final FoodController foodController = Get.find();
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  // final RestaurantController restaurantController = RestaurantController();
  final Utilities utilities = Utilities();

  // ImagesSliderFull(this.firebaseFunctions);

  item(String imagePath, String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH / 2.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 320,
            decoration: (imagePath == '' || imagePath == null)
                ? BoxDecoration(color: Constants.GREY_COLOR, borderRadius: BorderRadius.circular(5))
                : BoxDecoration(
                    color: Constants.GREY_COLOR,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [Text('16' + ' min'.tr + ' • ' + 'Free Delivery')],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      // if ((userController?.user?.value.latitude != null ||
      //     userController?.user?.value.longitude != null))
      // reload()=>
      //   setState(() {});
      homeController.setUserLocation().then((value) => setState(() {}));

      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
              stream: firebaseFunctions.getAllRestaurantsWithFoodsStream(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? CircularProgressIndicator()
                    :
                    // (userController?.user?.value.latitude ==null || userController?.user?.value.longitude==null)?CircularProgressIndicator():
                    Row(
                        children: utilities
                            .getNearbyRestaurants(
                                snapshot.data.docs,
                                LatLng(userController?.user?.value?.latitude ?? 0.0,
                                    userController?.user?.value?.longitude??0.0))
                            .map((restaurantLatLng) => GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: Get.size.width * 0.8,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: RestaurantItemWidgetExpanded(
                                          Restaurant(
                                            name: restaurantLatLng['name'],
                                            imagePath: restaurantLatLng['image'],
                                            address: restaurantLatLng['address'],
                                            latitude: restaurantLatLng['geopoint'].latitude,
                                            longitude: restaurantLatLng['geopoint'].longitude,
                                            ratings: double.parse(
                                                restaurantLatLng['ratings'].toString()),
                                          ),
                                          distance: restaurantLatLng['distance'],
                                        )),
                                  ),
                                ))
                            .toList());
                // foodController.getFoodList.isEmpty
                //     ? CircularProgressIndicator()
                //     : Row(
                //     children: foodController.getFoodList.map<Widget>((Food data) {
                //       // print( 'data.data() ${data.data()}');
                //       return GestureDetector(
                //           onTap: () {
                //             Food food = Food(
                //               name:data.name,
                //               imagePath: data.imagePath,
                //               availableQuantity: data.availableQuantity,
                //               price: data.price,
                //             );
                //
                //             return Get.to(() => FoodItemAddToOrder(food));
                //           },
                //           child: item(data.imagePath, data.name));
                //     }).toList()
              }));
    });
  }
}
