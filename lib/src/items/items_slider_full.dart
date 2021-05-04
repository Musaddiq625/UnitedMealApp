import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/controllers/food_controller.dart';
import 'package:getx_app/src/controllers/home_controller.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/pages/food_item_add_to_order.dart';
import '../const.dart';

class ImagesSliderFull extends StatelessWidget {
  ImagesSliderFull(this.homeController);
  final HomeController homeController;
  final UserController userController = Get.find();
  final FoodController foodController = Get.find();
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  // ImagesSliderFull(this.firebaseFunctions);

  item(String imagePath, String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH / 2.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 320,
            decoration: (imagePath == '' || imagePath == null)
                ? BoxDecoration(color: Constants.GREY_COLOR, borderRadius: BorderRadius.circular(5))
                : BoxDecoration(
                    color: Constants.GREY_COLOR,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [Text(/*'16' + ' min'.tr + */'• ' + 'Free Delivery')],
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
        child: StreamBuilder(
            stream: firebaseFunctions.getAllFoodsStream(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? CircularProgressIndicator()
                  :

              Obx(()=>Row(
                  children: snapshot.data.docs.map<Widget>((data) {

                    // print( 'data.data() ${data.data()}');
                    return (homeController.activeCuisines .contains(data.data()['cuisine']) &&
                        homeController.activeCuisines.isNotEmpty || homeController.activeCuisines.isEmpty)? GestureDetector(
                        onTap: () async {
                          print('data.data().toString()');
                          print(data.data().toString());

                          Food food = Food(

                              name: data.data()['name'],
                              imagePath: data.data()['image'],
                              availableQuantity: data.data()['availableQuantity'],
                              price: double.parse(data.data()['price'].toString()),
                              cuisine: data.data()['cuisine'],
                              restaurantId: data.data()['restaurant_id'],
                              restaurantName:data.data()['restaurant_name']);

                          // food = Food(
                          //     name: value['name'],
                          //     imagePath: value['image'],
                          //     availableQuantity: value['available_quantity'],
                          //     price: value['price'],
                          //     restaurantName: value['name']);
                          Get.to(() => FoodItemAddToOrder(food));

                        },
                        child: item(data.data()['image'], data.data()['name'])):Container();
                  }).toList()));
            }));
    // foodController.getFoodList.isEmpty
    //     ? CircularProgressIndicator()
    //     : Row(
    //     children: foodController.getFoodList.map<Widget>((Food data) {
    //       // print( 'data.data() ${data.data()}');
    //       return GestureDetector(
    //           onTap: () {
    //             Food food = Food(
    //               name:data.name,
    //               imagePath: data.imagePath,
    //               availableQuantity: data.availableQuantity,
    //               price: data.price,
    //             );
    //
    //             return Get.to(() => FoodItemAddToOrder(food));
    //           },
    //           child: item(data.imagePath, data.name));
    //     }).toList()
    // ));
  }
}
