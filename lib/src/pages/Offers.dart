import 'package:flutter/material.dart';
import 'package:getx_app/src/images_path.dart';
import 'package:getx_app/src/items/chip_widget.dart';
import 'package:getx_app/src/items/closable_dialog.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/items/food_item_widget.dart';
import 'package:getx_app/temp_data.dart';

class Offers extends StatelessWidget {
  final Components components = Components();

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
            for (int i = 0; i < TempData.tempFoodItems.length; i++)
              FoodItemWidget(
                  TempData.tempFoodItems[i]['food'])
          ],
        ),
      ),
    );
  }
}
