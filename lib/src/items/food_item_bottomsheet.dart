import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import '../const.dart';
import '../images_path.dart';

class FoodItemBottomSheet extends StatelessWidget {
  final Food foodModel;
  FoodItemBottomSheet(this.foodModel);
  // final String name, cuisines, imagePath1, imagePath2;
  // final int readyInMint, distance;
  //
  // FoodItemBottomSheet(this.name, this.cuisines, this.imagePath1, this.readyInMint, this.distance,
  //     {this.imagePath2});

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
                        image: DecorationImage(image: AssetImage(foodModel.imagePath)))),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(image: AssetImage(foodModel.imagePath)))),
              ),
            ],
          ),
          Text(foodModel.name, textScaleFactor: 1.4, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text(
                    foodModel.cuisines.toString().substring(1,
                        foodModel.cuisines.toString().length-1
                    ),textScaleFactor: 1.2,
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
