import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import '../const.dart';

class RestaurantItemWidgetExpanded extends StatelessWidget {
  // final Food foodModel;
  final Restaurant currentRestaurantModel;
  RestaurantItemWidgetExpanded(
      // this.foodModel,
      this.currentRestaurantModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.3)))),
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration:
              (currentRestaurantModel.imagePath==''|| currentRestaurantModel.imagePath==null)?BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(5)):
              BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: NetworkImage(currentRestaurantModel.imagePath), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    currentRestaurantModel.name,
                    textScaleFactor: 1.3,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$ • '//
                              // +
                              // foodModel.cuisine.toString().substring(1, foodModel.cuisine.toString().length - 1),
                          ,
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
                      // Text('${foodModel.deliveryTimeInMin} min')
                      Text('min')
                    ],
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('${currentRestaurantModel.ratings}',
                              textScaleFactor: 1.1,
                              style: TextStyle(color:Constants.FONT_GREY_COLOR, fontWeight: FontWeight.bold)),
                          Icon(Icons.star, color: Constants.FONT_GREY_COLOR,size: 22),
                          // Text(' ${foodModel.totalRatings}+' + 'ratings'.tr,
                          Text( 'ratings'.tr,
                              textScaleFactor: 1.1,
                              style: TextStyle(color: Constants.FONT_GREY_COLOR, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      // Text('${foodModel.deliveryType}',
                      Text('type',
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
