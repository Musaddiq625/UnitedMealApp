import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/src/const.dart';

import 'food_item_add_to_order.dart';

class SpecialInstruction extends StatelessWidget {
  final Function updateFoodComment;
  final Food foodModel;
  SpecialInstruction(this.updateFoodComment,this.foodModel);
   final TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.05),
              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.5)))),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.APP_HORIZONTAL_WIDTH, vertical: 20),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Center(
                    child: Text(
                      'special_instruction'.tr,
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateFoodComment(commentController.text);
                      Get.off(FoodItemAddToOrder(foodModel));
                    },
                    child: Text('done'.tr,
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: Constants.APP_COLOR,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  ),
                ],
              ))),
      Container(
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
        child: Column(
          children: [
            TextField(
              controller: commentController,
              maxLines: null,
              maxLength: 500,
              decoration: InputDecoration.collapsed(hintText: 'special_instruction_hint'.tr),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('if_item_is_unavailable'.tr.toUpperCase(), textScaleFactor: 0.8),
              SizedBox(height: 5),
              Text('contact_me'.tr,
                  textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
            Icon(Icons.arrow_forward_ios, size: 20, color: Constants.FONT_GREY_COLOR)
          ],
        ),
      )
    ]))));
  }
}
