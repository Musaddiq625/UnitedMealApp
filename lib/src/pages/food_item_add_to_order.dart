import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/food_item_add_to_order_controller.dart';
import 'package:getx_app/src/items/IncrementDecrementCounter.dart';
import 'package:getx_app/src/items/button_widget.dart';
import 'package:getx_app/src/items/underlined_listTile.dart';
import 'package:getx_app/src/pages/cart.dart';
import 'package:getx_app/src/pages/special_instruction.dart';

class FoodItemAddToOrder extends StatelessWidget {
  final Food foodModel;

  FoodItemAddToOrder(this.foodModel);

  final FoodItemAddToOrderController foodItemAddToOrderController =
      Get.put(FoodItemAddToOrderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(foodModel.imagePath), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH, vertical: 20),
            child: GestureDetector(
                onTap: () => Get.back(), child: Icon(Icons.cancel, color: Colors.grey, size: 30)),
          )
        ],
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.APP_HORIZONTAL_WIDTH,
            vertical: Constants.APP_HORIZONTAL_WIDTH * 1.2),
        child:
            Text(foodModel.name, textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Container(
        height: 15,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Constants.FONT_GREY_COLOR.withOpacity(.2),
            border: Border(
                top: BorderSide(color: Constants.FONT_GREY_COLOR.withOpacity(.4)),
                bottom: BorderSide(color: Constants.FONT_GREY_COLOR.withOpacity(.4)))),
      ),
      UnderLinedListTile('add_special_instruction'.tr, null,page: SpecialInstruction()),
      SizedBox(height: 50),
      Center(
        child: Obx(() => IncrementDecrementCounter(
            foodItemAddToOrderController.currentCount.value,
            foodItemAddToOrderController.incrementCount,
            foodItemAddToOrderController.decrementCount)),
      ),
      SizedBox(height: 200),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
        child: ButtonWidget(
          'add_to_order'.tr,
          trailingText: '\$'+foodModel.price.toString(),
          function: (){
            Get.to(CartPage('shopName'));
          },
        ),
      )
    ]))));
  }
}
