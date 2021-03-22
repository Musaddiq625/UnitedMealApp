import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import '../const.dart';

class FoodItemWidgetExpanded extends StatelessWidget {
  final Food foodModel;
  FoodItemWidgetExpanded(this.foodModel);
  // FoodItemWidgetExpanded(this.name, this.imagePath, this.deliveryTime, this.cuisines,
  //     this.averageRating, this.totalRatings, this.deliveryType);

  // final String name, imagePath, deliveryType;
  // final int deliveryTime, totalRatings;
  // final List<String> cuisines;
  // final double averageRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.3)))),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
        // height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              // width: 110,
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
                  SizedBox(height: 10),
                  Text(
                    foodModel.name,
                    textScaleFactor: 1.3,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$ • ' +
                              foodModel.cuisines.toString().substring(1, foodModel.cuisines.toString().length - 1),
                          textScaleFactor: 1.1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Constants.FONT_GREY_COLOR,
                            // Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text('${foodModel.deliveryTimeInMin} min')
                    ],
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('${foodModel.ratings}',
                              textScaleFactor: 1.1,
                              style: TextStyle(color:Constants.FONT_GREY_COLOR, fontWeight: FontWeight.bold)),
                          Icon(Icons.star, color: Constants.FONT_GREY_COLOR,size: 22),
                          Text(' ${foodModel.totalRatings}+' + 'ratings'.tr,
                              textScaleFactor: 1.1,
                              style: TextStyle(color: Constants.FONT_GREY_COLOR, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('${foodModel.deliveryType}',
                          textScaleFactor: 1.1,
                          style: TextStyle(color: Constants.FONT_GREY_COLOR, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
