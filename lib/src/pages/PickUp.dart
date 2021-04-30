import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/items/food_item_bottomsheet.dart';
import 'package:getx_app/temp_data.dart';

import 'food_item_add_to_order.dart';
import 'pickup_google_map.dart';

class PickUp extends StatelessWidget {
  final GlobalKey<ExpandableBottomSheetState> bottomSheetKey = new GlobalKey();
  final Components components = Components();
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableBottomSheet(
          key: bottomSheetKey,
          background: GestureDetector(
            onTap: () {
              bottomSheetKey.currentState.contract();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey.withOpacity(.5),
              alignment: Alignment.center,
              child: PickupGoogleMap(),
            ),
          ),
          persistentHeader: Container(
            color: Colors.white,
            height: 50,
            child: Center(
              child: Container(
                height: 7,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          expandableContent: Container(
            color: Colors.white,
            child: StreamBuilder(
              stream:  firebaseFunctions.getAllFoodsStream(),
              builder: (context, snapshot) {
                return Column(
                    children: snapshot.data == null
                    ? [CircularProgressIndicator()]
                        : snapshot.data.docs.map<Widget>((data) {
                  Food food =  Food(
                      name: data.data()['name'],
                      imagePath: data.data()['image'],
                      price: double.parse(data.data()['price'].toString()),
                      cuisine: data.data()['cuisine'],
                      restaurantId: data.data()['restaurant_id'],
                      restaurantName:data.data()['restaurant_name']
                  );
                  return GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          FoodItemAddToOrder(food
                            // TempData.tempRestaurantsWithFoods[j].restaurantFoods[i]
                          ));
                    },
                    child: FoodItemBottomSheet(
                      food,
                      // TempData.tempRestaurantsWithFoods[0],
                    )
                  );
                }).toList(),
                );
                // Column(
                //   children: [
                //     SizedBox(height: 20),
                //     components.textWithWidget('restaurants_nearby'.tr),
                //     SizedBox(height: 15),
                //     for (int i = 0; i < 2 /*TempData.tempFoodItems.length*/; i++)
                //       FoodItemBottomSheet(
                //         TempData.tempRestaurantsWithFoods[0].restaurantFoods[i],
                //         TempData.tempRestaurantsWithFoods[0],
                //       ),
                //   ],
                // );
              }
            ),
          )),
    );
  }
}
