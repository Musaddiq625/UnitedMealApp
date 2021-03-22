import 'package:flutter/material.dart';
import 'package:getx_app/src/items/app_bar.dart';
import 'package:get/get.dart';
import 'package:getx_app/temp_data.dart';
import '../const.dart';
import 'food_item_add_to_order.dart';

class PopularItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppBarWidget(
          null,
          Icons.search,
          leadingWidget: GestureDetector(
            onTap: () => Get.back(),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_sharp, color: Constants.APP_COLOR),
                SizedBox(width: 5),
                Text('back'.tr, style: TextStyle(color: Constants.APP_COLOR))
              ],
            ),
          ),
          title: 'popular_items'.tr,
        ),
        SizedBox(height: 30),
        Text('popular_items_tagline'.tr, softWrap: true),
        Divider(color: Constants.FONT_GREY_COLOR.withOpacity(.5)),
        SizedBox(height: 10),
        Container(
          height: 220,
          // width: Get.size.width * 0.85,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(TempData.tempFoodItems[0]['food'].imagePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(height: 10),
        for (int i = 0; i < TempData.tempFoodItems.length; i++)
          GestureDetector(
            onTap: () {
              Get.to(() => FoodItemAddToOrder(TempData.tempFoodItems[i]['food']));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Constants.FONT_GREY_COLOR.withOpacity(.3)))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(TempData.tempFoodItems[i]['food'].name,
                    textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text('\$${TempData.tempFoodItems[i]['food'].price}',
                    textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
          )
      ]),
    ))));
  }
}
