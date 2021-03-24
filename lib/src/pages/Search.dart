import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/search_controller.dart';
import 'package:getx_app/src/images_path.dart';
import 'package:getx_app/src/items/components.dart';
import 'file:///D:/Flutter%20Projects/getx_app/lib/src/pages/restaurant_details.dart';
import 'package:getx_app/src/items/food_item_widget_expanded.dart';
import 'package:getx_app/src/items/restaurant_widget_expanded.dart';

import '../../temp_data.dart';
import 'food_details.dart';
import 'food_item_add_to_order.dart';

class Search extends StatelessWidget {
  final Components components = Components();
  final SearchController searchController = Get.put(SearchController());

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
              Expanded(child: components.searchTextField()),
              Text('cancel'.tr,
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Constants.APP_COLOR, fontWeight: FontWeight.bold)),
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
                  SearchController.selectedIndex.value =
                  SearchController.selectedIndex.value == 0 ? 1 : 0;
                  searchController.changePageControllerValue(SearchController.selectedIndex.value);
                },
                child: Obx(() => components.slideSelector(
                    // searchController.searchTypesList
                    ['stores'.toString().tr + '(50)', 'items'.toString().tr + '(3)'],
                    SearchController.selectedIndex.value)))
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
                        ),
                  ],
                ),
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
                            Get.to(() => FoodItemAddToOrder(
                                TempData.tempRestaurantsWithFoods[j].restaurantFoods[i]));
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
