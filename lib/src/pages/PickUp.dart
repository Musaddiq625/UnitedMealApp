import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/items/food_item_bottomsheet.dart';
import 'package:getx_app/temp_data.dart';

import 'pickup_google_map.dart';

class PickUp extends StatelessWidget {
  final GlobalKey<ExpandableBottomSheetState> bottomSheetKey = new GlobalKey();
  final Components components = Components();

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
            child: Column(
              children: [
                SizedBox(height: 20),
                components.textWithWidget('restaurants_nearby'.tr),
                SizedBox(height: 15),
                for (int i = 0; i < 2 /*TempData.tempFoodItems.length*/; i++)
                  FoodItemBottomSheet(
                    TempData.tempRestaurantsWithFoods[0].restaurantFoods[i],
                    TempData.tempRestaurantsWithFoods[0],
                  ),
              ],
            ),
          )),
    );
  }
}
