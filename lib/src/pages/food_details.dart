// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:getx_app/models/food.dart';
// import 'package:getx_app/models/restaurant.dart';
// import 'package:getx_app/src/const.dart';
// import 'package:getx_app/src/controllers/food_item_details_controller.dart';
// import 'package:getx_app/src/items/underlined_listTile.dart';
// import 'package:getx_app/src/pages/popular_items.dart';
// import 'package:getx_app/temp_data.dart';
// import '../items/app_bar.dart';
// import '../items/item_selector_widget.dart';
//
// class FoodItemDetails extends StatelessWidget {
//   final Food foodModel;
//   final Restaurant currentRestaurant;
//
//   FoodItemDetails(this.foodModel, this.currentRestaurant);
//
//   final FoodItemDetailsController foodItemDetailsController = Get.put(FoodItemDetailsController());
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           AppBarWidget(null, null,
//               leadingWidget: GestureDetector(
//                 onTap: () => Get.back(),
//                 child: Row(
//                   children: [
//                     Icon(Icons.arrow_back_ios_sharp, color: Constants.APP_COLOR),
//                     SizedBox(width: 5),
//                     Text('back'.tr, style: TextStyle(color: Constants.APP_COLOR))
//                   ],
//                 ),
//               ),
//               trailingWidget: Row(
//                 children: [
//                   Icon(Icons.group_add_outlined, color: Constants.APP_COLOR),
//                   SizedBox(width: 20),
//                   Icon(Icons.search, color: Constants.APP_COLOR),
//                   SizedBox(width: 10)
//                 ],
//               )),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(foodModel?.name,
//                     textScaleFactor: 3, style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 10),
//                 Text('\$\$ • ' + currentRestaurant.getCuisines(),
//                     style: TextStyle(color: Constants.FONT_GREY_COLOR)),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         RatingBar.builder(
//                             itemCount: 5,
//                             itemSize: 20,
//                             ignoreGestures: true,
//                             allowHalfRating: true,
//                             initialRating: currentRestaurant?.ratings??0,
//                             itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
//                             onRatingUpdate: (_) {}),
//                         SizedBox(width: 5),
//                         Text('newly_added'.tr, style: TextStyle(color: Constants.FONT_GREY_COLOR)),
//                       ],
//                     ),
//                     Obx(() => ItemSelectorWidget(
//                         'delivery'.tr,
//                         'pickup'.tr,
//                         foodItemDetailsController.selectedIndex.value,
//                         (int updatedIndex) =>
//                             foodItemDetailsController.changeDeliveryType(updatedIndex)))
//                   ],
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//           Obx(() => Column(children: [
//                 foodItemDetailsController.selectedIndex.value == 0
//                     ? Container()
//                     : Container(
//                         color: Constants.APP_COLOR.withOpacity(.15),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                             Text(
//                               'this_is_a_pickup_order'.tr,
//                               textScaleFactor: 1.2,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 10),
//                             RichText(
//                                 text: TextSpan(children: [
//                               TextSpan(
//                                   text: 'you_ll_need_to_go_to'.tr +
//                                       ' ' +
//                                       foodModel.restaurantName +
//                                       ' ' +
//                                       'to_pickup_this_order'.tr +
//                                       ': ',
//                                   style:
//                                       TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                               TextSpan(
//                                   text: '2435 East Bell Road,',
//                                   style: TextStyle(
//                                       color: Constants.APP_COLOR, fontWeight: FontWeight.bold)),
//                               TextSpan(
//                                   text: ' 3.5 miles away.',
//                                   style:
//                                       TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                             ])),
//                           ]),
//                         )),
//               ])),
//           SizedBox(height: 20),
//           Padding(
//               padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
//               child: Text('featured_items'.tr,
//                   textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold))),
//           SizedBox(height: 15),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(children: [
//               for (int i = 0; i < 4; i++)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 220,
//                         width: Get.size.width * 0.85,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage(currentRestaurant.restaurantFoods[i].imagePath), fit: BoxFit.cover)),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         currentRestaurant.restaurantFoods[i].name,
//                         textScaleFactor: 1.2,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         '\$ ${currentRestaurant.restaurantFoods[i].price}',
//                         textScaleFactor: 1.2,
//                         style: TextStyle(
//                             color: Constants.FONT_GREY_COLOR, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 )
//             ]),
//           ),
//           SizedBox(height: 25),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('full_menu'.tr,
//                     textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text('switch_menu'.tr,
//                     textScaleFactor: 1.1,
//                     style: TextStyle(
//                         color: Constants.APP_COLOR, decoration: TextDecoration.underline)),
//               ],
//             ),
//           ),
//           SizedBox(height: 25),
//               UnderLinedListTile('popular_items'.tr, currentRestaurant.restaurantFoods.length,page: PopularItems(currentRestaurant)),
//               UnderLinedListTile('weekend_special'.tr, 1),
//           for (int i = 0; i < TempData.tempRestaurantsWithFoods[0].restaurantFoods.length; i++)
//             UnderLinedListTile(TempData.tempRestaurantsWithFoods[0].restaurantFoods[i].name,
//                 TempData.tempRestaurantsWithFoods[0].restaurantFoods.length
//             ),
//         ])),
//       ),
//     );
//   }
// }
