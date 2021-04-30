import 'package:flutter/material.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import '../const.dart';

class FoodItemWidgetExpanded extends StatelessWidget {
  final Food foodModel;
  // final Restaurant currentRestaurantModel;
  FoodItemWidgetExpanded(this.foodModel
      // ,this.currentRestaurantModel
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.3)))),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              // width: 110,
              decoration:
              (foodModel.imagePath==''|| foodModel.imagePath==null)?
              BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5)):BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: NetworkImage(foodModel.imagePath), fit: BoxFit.cover)),
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
                          '\$ • ${foodModel.price}',
                              // +
                              // currentRestaurantModel.getCuisines(),
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

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
