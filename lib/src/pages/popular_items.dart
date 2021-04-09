import 'package:flutter/material.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/items/app_bar.dart';
import 'package:get/get.dart';
import '../const.dart';
import 'food_item_add_to_order.dart';

class PopularItems extends StatelessWidget {
  final Restaurant restaurantModel;
  PopularItems(this.restaurantModel);
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
          
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(restaurantModel.restaurantFoods[0].imagePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(height: 10),
        for (int i = 0; i <restaurantModel.restaurantFoods.length; i++)
          GestureDetector(
            onTap: () {
              Get.to(() => FoodItemAddToOrder({}/*restaurantModel.restaurantFoods[i])*/));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Constants.FONT_GREY_COLOR.withOpacity(.3)))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(restaurantModel.restaurantFoods[i].name,
                    textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text('\$${restaurantModel.restaurantFoods[i].price}',
                    textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
          )
      ]),
    ))));
  }
}
