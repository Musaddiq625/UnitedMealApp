import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import '../const.dart';
class FoodItemBottomSheet extends StatelessWidget {
  final Food foodModel;
  // final Restaurant restaurantModel;
  FoodItemBottomSheet(this.foodModel);//, this.restaurantModel);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration:
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.3)))),

      padding: EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH,vertical:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(image: NetworkImage(foodModel.imagePath)))),
              ),
              // SizedBox(width: 15),
              // Expanded(
              //   child: Container(
              //       height: 150,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5),
              //           image: DecorationImage(image: NetworkImage(foodModel.imagePath)))),
              // ),
            ],
          ),
          Text(foodModel.name, textScaleFactor: 1.4, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text(
                    // restaurantModel.getCuisines()
                    foodModel.restaurantName
                    ,textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  )),
              Text(
                'ready_in'.tr + ' ${foodModel.deliveryTimeInMin} min',textScaleFactor: 1.2,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('0 ' + Constants.DISTANCE_UNIT,
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
}
