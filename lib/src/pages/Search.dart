import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/search_controller.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/items/food_item_widget_expanded.dart';
import 'package:getx_app/src/items/restaurant_widget_expanded.dart';
import 'package:getx_app/src/pages/restaurant_details.dart';

import '../../temp_data.dart';
import 'food_item_add_to_order.dart';

class Search extends StatelessWidget {
  final Components components = Components();
  final SearchController searchController = Get.put(SearchController());
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              offset: Offset(1, 1.2),
            )
          ]),
          child: Row(
            children: [
              Obx(() => Expanded(
                  child: components.searchTextField(searchController.getSelectedIndex == 0
                      ? searchController.storesTextFieldController
                      : searchController.itemsTextFieldController))),
              GestureDetector(
                onTap: () {
                  if (searchController.getSelectedIndex == 0)
                    searchController.storesTextFieldController.clear();
                  else
                    searchController.itemsTextFieldController.clear();
                },
                child: Text('cancel'.tr,
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Constants.APP_COLOR, fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
              left: Constants.APP_HORIZONTAL_WIDTH,
              right: Constants.APP_HORIZONTAL_WIDTH,
              bottom: 10),
          child: Column(children: [
            GestureDetector(
                onTap: () {
                  searchController.setSelectedIndex =
                      searchController.getSelectedIndex == 0 ? 1 : 0;

                  searchController.changePageControllerValue(searchController.getSelectedIndex);
                },
                child: Obx(() => components.slideSelector(
                    // searchController.searchTypesList
                    ['stores'.toString().tr + '(50)', 'items'.toString().tr + '(3)'],
                    searchController.getSelectedIndex)))
          ]),
        ),
        Expanded(
          child: PageView(
            controller: searchController.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ///STORES
              SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < TempData.tempRestaurantsWithFoods.length; i++)
                      for (int j = 0;
                          j < TempData.tempRestaurantsWithFoods[i].restaurantFoods.length;
                          j++)
                        GestureDetector(
                          onTap: () {
                            Get.to(RestaurantDetails(
                              TempData.tempRestaurantsWithFoods[i].restaurantFoods[j],
                              TempData.tempRestaurantsWithFoods[i],
                            ));
                          },
                          child: RestaurantItemWidgetExpanded(
                            TempData.tempRestaurantsWithFoods[j].restaurantFoods[i],
                            TempData.tempRestaurantsWithFoods[j],
                          ),
                        )
                  ],
                ),
                // StreamBuilder(
                //     stream: firebaseFunctions.getAllFoods(),
                //     builder: (context, snapshot) {
                //     return Column(
                //       children: [
                //     snapshot.data.docs.map<Widget>((data) {
                //             return GestureDetector(
                //               onTap: () {
                //                 Get.to(RestaurantDetails(
                //                   data.data()['name'],
                //                   TempData.tempRestaurantsWithFoods[i],
                //                 ));
                //               },
                //               child: RestaurantItemWidgetExpanded(
                //                 TempData.tempRestaurantsWithFoods[j].restaurantFoods[i],
                //                 TempData.tempRestaurantsWithFoods[j],
                //               ),
                //             );}).toList(),
                //       ],
                //     );
                //   }
                // ),
              ),

              ///ITEMS
              SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < TempData.tempRestaurantsWithFoods.length; i++)
                      for (int j = 0;
                          j < TempData.tempRestaurantsWithFoods[i].restaurantFoods.length;
                          j++)
                        GestureDetector(
                          onTap: () {
                            Get.to(() => FoodItemAddToOrder(Food()
                                // TempData.tempRestaurantsWithFoods[j].restaurantFoods[i]
                                ));
                          },
                          child: FoodItemWidgetExpanded(
                            TempData.tempRestaurantsWithFoods[i].restaurantFoods[j],
                            TempData.tempRestaurantsWithFoods[i],
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
