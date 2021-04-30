import 'package:flutter/material.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/src/items/chip_widget.dart';
import 'package:getx_app/src/items/closable_dialog.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/items/food_item_widget.dart';
import 'package:getx_app/temp_data.dart';

import 'food_item_add_to_order.dart';

class Offers extends StatelessWidget {
  final Components components = Components();final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            components.textWithWidget('Offers'),
            ClosableWidget(),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChipWidget('cuisines'.tr,
                      widgetList: [Icon(Icons.keyboard_arrow_down_sharp, size: 19)]),
                  ChipWidget('${'offer_type'.tr}',
                      widgetList: [Icon(Icons.keyboard_arrow_down_sharp, size: 19)]),
                  ChipWidget(
                    '${'over'.tr} 4.5',
                    widgetList: [
                      SizedBox(width: 3),
                      Icon(Icons.star, size: 18),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Container(height: 18, width: 1.5, color: Colors.black)),
                      Icon(Icons.keyboard_arrow_down_sharp, size: 19),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            components.textWithWidget('Top Picks For You'),
            SizedBox(height: 10),
            StreamBuilder(
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
                        // Get.to(() =>
                        //     FoodItemWidget(food
                        //       // TempData.tempRestaurantsWithFoods[j].restaurantFoods[i]
                        //     ));
                         Get.to(() => FoodItemAddToOrder(food));
                      },
                      child: FoodItemWidget(
                        food,
                        // TempData.tempRestaurantsWithFoods[0],
                      )
                  );
                }).toList(),
                );
              }
            ),
            // for (int i = 0; i < TempData.tempRestaurantsWithFoods.length; i++)
            //   FoodItemWidget(
            //       TempData.tempRestaurantsWithFoods[0].restaurantFoods[i])
          ],
        ),
      ),
    );
  }
}
