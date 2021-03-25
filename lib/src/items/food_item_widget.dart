import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import '../const.dart';

class FoodItemWidget extends StatelessWidget {
  final Food foodModel;
  FoodItemWidget(this.foodModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.3)))),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
        height: 110,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: AssetImage(foodModel.imagePath), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$0 ' + 'delivery_fee'.tr,
                    style: TextStyle(
                      color: Constants.APP_BLUE_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    foodModel.name,
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("${foodModel.deliveryTimeInMin} Min")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
