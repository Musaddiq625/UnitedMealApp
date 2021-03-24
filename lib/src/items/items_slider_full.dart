import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/pages/food_details.dart';
import 'package:getx_app/src/pages/food_item_add_to_order.dart';
import '../../temp_data.dart';
import '../const.dart';
import 'package:get/get.dart';

import '../pages/restaurant_details.dart';

class ImagesSliderFull extends StatelessWidget {
  // final String name, deliveryTime, deliveryType;
  //
  // ImagesSliderFull(this.name, this.deliveryTime, this.deliveryType);
  final UserController userController = Get.find();

  item(String imagePath, String label) {
    // onTap: () {
    //   print('userController.user.isGuest');
    //   print(userController?.user?.isGuest);
    //   userController.checkIsLoggedIn();
    // },
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH / 2.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 320,
            decoration: BoxDecoration(
                color: Constants.GREY_COLOR,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(height: 50, width: 50, child: Image.asset(imagePath)),
                // ),
                // SizedBox(height: 10),
                // Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [Text('16' + ' min'.tr + ' • ' + 'Free Delivery')],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (int i = 0; i < TempData.tempRestaurantsWithFoods.length; i++)
          GestureDetector(
              onTap: () => Get.to(() => FoodItemAddToOrder(
                TempData.tempRestaurantsWithFoods[0].restaurantFoods[i],
                // TempData.tempRestaurantsWithFoods[0],
              )),
              child: item(TempData.tempRestaurantsWithFoods[0].restaurantFoods[i].imagePath,
                  TempData.tempRestaurantsWithFoods[0].restaurantFoods[i].name))
      ]),
    );
  }
}
