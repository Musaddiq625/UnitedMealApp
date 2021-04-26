import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
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
    // searchController.setSelectedIndex = 0;
    // searchController.itemsTextFieldController.clear();
    // searchController.storesTextFieldController.clear();
    // searchController.itemsSearchListResult.clear();
    // searchController.storesSearchListResult.clear();
    print(searchController.itemsSearchListResult);
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
              Obx(() =>
                  Expanded(
                      child: components.searchTextField(searchController.getSelectedIndex == 0
                          ? searchController.storesTextFieldController
                          : searchController.itemsTextFieldController,
                            (_) {
                          if (searchController.getSelectedIndex == 0) {
                            if(searchController.getStores != [])
                            searchController.onSearchStores(_, searchController.getStores);
                          }
                          else {
                            if(searchController.getItems != [])
                            searchController.onSearchItems(_, searchController.getItems);
                          }
                        },


                      ))),
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
                  firebaseFunctions.getAllFoodsTotal();
                  searchController.setSelectedIndex =
                  searchController.getSelectedIndex == 0 ? 1 : 0;

                  searchController.changePageControllerValue(searchController.getSelectedIndex);
                },
                child: Obx(() =>
                    components.slideSelector(
                      // searchController.searchTypesList
                        [
                          'stores'
                              .toString()
                              .tr + ' ( ${searchController.getTotalStores} )',
                          'items'
                              .toString()
                              .tr + ' ( ${searchController.getTotalItems} )'
                        ], searchController.getSelectedIndex)))
          ]),
        ),
        Expanded(
          child: PageView(
            controller: searchController.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [

              ///STORES
             Obx(()=> SingleChildScrollView(
               child: //
               searchController.storesSearchListResult.isNotEmpty?
               Column(
                 children:
                 searchController.storesSearchListResult.map<Widget>((data) {
                   return GestureDetector(
                     onTap: () {
                       Get.to(() =>
                           FoodItemAddToOrder(Food()
                             // TempData.tempRestaurantsWithFoods[j].restaurantFoods[i]
                           ));
                     },
                     child: FoodItemWidgetExpanded(
                       // TempData.tempRestaurantsWithFoods[i].restaurantFoods[j],
                       // TempData.tempRestaurantsWithFoods[i],
                         Food(
                           name: data['name'],
                           imagePath: data['image'],
                           price: double.parse(data['price']??'0'),
                           cuisine: data['cuisine'],
                         )),
                   );
                 }).toList(),
               ):
               StreamBuilder(
                   stream: firebaseFunctions.getAllRestaurantsWithFoodsStream(),
                   builder: (context, snapshot) {
                     if (searchController.getStores.isEmpty && snapshot.data != null) {
                       // searchController.storesSearchList.assignAll(snapshot.data.docs);
                       for (int i = 0; i < snapshot.data.docs.length; i++)
                         searchController.storesSearchList.add(snapshot.data.docs[i].data());
                     }

                     // print('snapshot.data.docs ${snapshot.data.docs}');
                     return Column(
                       children: snapshot.data == null
                           ? [CircularProgressIndicator()]
                           : snapshot.data.docs.map<Widget>((QueryDocumentSnapshot data) {
                         return GestureDetector(
                           child: RestaurantItemWidgetExpanded(
                             // TempData.tempRestaurantsWithFoods[j].restaurantFoods[i],
                             Restaurant(
                               name: data.data()['name'],
                               imagePath: data.data()['image'],
                               address: data.data()['address'],
                               latitude: data.data()['geopoint'].latitude,
                               longitude: data.data()['geopoint'].longitude,
                               ratings: double.parse(data.data()['ratings']),
                             ),
                           ),
                         );
                       }).toList(),
                     );
                   }),
             )),

              ///ITEMS
            Obx(()=>  SingleChildScrollView(
              child: //
              searchController.itemsSearchListResult.isNotEmpty?
              Column(
                children:
                searchController.itemsSearchListResult.map<Widget>((data) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          FoodItemAddToOrder(Food()
                            // TempData.tempRestaurantsWithFoods[j].restaurantFoods[i]
                          ));
                    },
                    child: FoodItemWidgetExpanded(
                      // TempData.tempRestaurantsWithFoods[i].restaurantFoods[j],
                      // TempData.tempRestaurantsWithFoods[i],
                        Food(
                          name: data['name']??'',
                          imagePath: data['image']??'',
                          price: double.parse(data['price']??'0'),
                          cuisine: data['cuisine']??'',
                        )),
                  );
                }).toList(),
              ):
              StreamBuilder(
                  stream: firebaseFunctions.getAllFoodsStream(),
                  builder: (context, snapshot) {
                    if (searchController.getItems.isEmpty && snapshot.data != null) {
                      // searchController.itemsSearchList.assignAll(snapshot.data.docs);
                      for (int i = 0; i < snapshot.data.docs.length; i++)
                        searchController.itemsSearchList.add(snapshot.data.docs[i].data());
                    }
                    return Column(
                      children: snapshot.data == null
                          ? [CircularProgressIndicator()]
                          : snapshot.data.docs.map<Widget>((QueryDocumentSnapshot data) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() =>
                                FoodItemAddToOrder(Food()
                                  // TempData.tempRestaurantsWithFoods[j].restaurantFoods[i]
                                ));
                          },
                          child: FoodItemWidgetExpanded(
                            // TempData.tempRestaurantsWithFoods[i].restaurantFoods[j],
                            // TempData.tempRestaurantsWithFoods[i],
                              Food(
                                name: data.data()['name'],
                                imagePath: data.data()['image'],
                                price: double.parse(data.data()['price'].toString()),
                                cuisine: data.data()['cuisine'],
                              )),
                        );
                      }).toList(),
                    );
                  }),
            )),
            ],
          ),
        )
      ],
    );
  }
}
