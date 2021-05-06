import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/restaurant_controller.dart';
import 'package:getx_app/src/items/underlined_listTile.dart';
import 'package:getx_app/src/pages/popular_items.dart';
import 'package:getx_app/temp_data.dart';
import '../items/app_bar.dart';
import '../items/item_selector_widget.dart';
import 'food_item_add_to_order.dart';

class RestaurantDetails extends StatelessWidget {
  // final Food foodModel;
  final Restaurant restaurantModel;
  final double distance;

  RestaurantDetails(/*this.foodModel,*/ this.restaurantModel, this.distance);

  RestaurantController restaurantController;

  myWidget(
      String label1, double value1, String label2, double value2, String label3, double value3) {
    return Row(children: [
      Column(children: [
        Text('\$$value1', textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$label1'),
      ]),
      SizedBox(width: 10),
      Column(children: [
        Text('$value2', textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$label2'),
      ]),
      SizedBox(width: 10),
      Column(children: [
        Text('$value3', textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$label3'),
      ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    restaurantController = Get.put(RestaurantController(restaurantModel.name));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppBarWidget(null, null,
              leadingWidget: GestureDetector(
                onTap: () => Get.back(),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_sharp, color: Constants.APP_COLOR),
                    SizedBox(width: 5),
                    Text('back'.tr, style: TextStyle(color: Constants.APP_COLOR))
                  ],
                ),
              ),
              trailingWidget: Row(
                children: [
                  Icon(Icons.group_add_outlined, color: Constants.APP_COLOR),
                  SizedBox(width: 20),
                  Icon(Icons.search, color: Constants.APP_COLOR),
                  SizedBox(width: 10)
                ],
              )),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurantModel?.name,
                    textScaleFactor: 3, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('\$\$ • ' + restaurantModel.getCuisines(),
                    style: TextStyle(color: Constants.FONT_GREY_COLOR)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                            itemCount: 5,
                            itemSize: 20,
                            ignoreGestures: true,
                            allowHalfRating: true,
                            initialRating: restaurantModel?.ratings ?? 0,
                            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (_) {}),
                        SizedBox(width: 5),
                        Text('newly_added'.tr, style: TextStyle(color: Constants.FONT_GREY_COLOR)),
                      ],
                    ),
                    Text('')
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Obx(() => myWidget(
                    'fees'.tr,
                    restaurantController.selectedIndex.value == 0 ? 0 : 0,
                    'min'.tr,
                    restaurantController.selectedIndex.value == 0 ? 0 : 0,
                    'miles'.tr,
                    double.parse(distance.toStringAsFixed(2)),
                  )),
              Obx(() => ItemSelectorWidget(
                  'delivery'.tr,
                  'pickup'.tr,
                  restaurantController.selectedIndex.value,
                  (int updatedIndex) => restaurantController.changeDeliveryType(updatedIndex)))
            ]),
          ),
          SizedBox(height: 15),
          Obx(() => Column(children: [
                restaurantController.selectedIndex.value == 0
                    ? Container()
                    : Container(
                        color: Constants.APP_COLOR.withOpacity(.15),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(
                              'this_is_a_pickup_order'.tr,
                              textScaleFactor: 1.2,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'you_ll_need_to_go_to'.tr +
                                      ' ' +
                                      restaurantModel.name +
                                      ' ' +
                                      'to_pickup_this_order'.tr +
                                      ': ',
                                  style:
                                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '2435 East Bell Road,',
                                  style: TextStyle(
                                      color: Constants.APP_COLOR, fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' 3.5 miles away.',
                                  style:
                                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ])),
                          ]),
                        )),
              ])),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
              child: Text('featured_items'.tr,
                  textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i < 0; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        width: Get.size.width * 0.85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(restaurantModel.restaurantFoods[i].imagePath),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        restaurantModel.restaurantFoods[i].name,
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$ ${restaurantModel.restaurantFoods[i].price}',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            color: Constants.FONT_GREY_COLOR, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
            ]),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('full_menu'.tr,
                    textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('switch_menu'.tr,
                    textScaleFactor: 1.1,
                    style: TextStyle(
                        color: Constants.APP_COLOR, decoration: TextDecoration.underline)),
              ],
            ),
          ),
          SizedBox(height: 25),
          // UnderLinedListTile('popular_items'.tr, restaurantModel.restaurantFoods.length.toString(), page: PopularItems(restaurantModel)),
          UnderLinedListTile('weekend_special'.tr, '1'),
          // for (int i = 0; i < TempData.tempRestaurantsWithFoods[0].restaurantFoods.length; i++)
          //   UnderLinedListTile(TempData.tempRestaurantsWithFoods[0].restaurantFoods[i].name,
          //       TempData.tempRestaurantsWithFoods[0].restaurantFoods.length.toString()),
          Obx(() => Column(children: [
                for (int i = 0; i < restaurantController.foodsList.length; i++)
                  UnderLinedListTile(
                    restaurantController.foodsList[i].name,
                    // restaurantController.foodsList[i]
                    '${ restaurantController.foodsList[i].availableQuantity}',
                    page: FoodItemAddToOrder(Food(
                        name: restaurantController.foodsList[i].name,
                        imagePath: restaurantController.foodsList[i].imagePath,
                        availableQuantity: restaurantController.foodsList[i].availableQuantity,
                        price: restaurantController.foodsList[i].price,
                        cuisine: restaurantController.foodsList[i].cuisine,
                        restaurantId: restaurantController.foodsList[i].restaurantId,
                        restaurantName: restaurantController.foodsList[i].restaurantName)),
                  ),
              ]))
        ])),
      ),
    );
  }
}
