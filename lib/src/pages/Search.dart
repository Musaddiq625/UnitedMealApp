import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/search_controller.dart';
import 'package:getx_app/src/images_path.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/items/food_item_widget_expanded.dart';

import '../../temp_data.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
          child: Column(children: [
            GestureDetector(
                onTap: () {
                  searchController.changeValue(searchController.selectedIndex.value == 0 ? 1 : 0);
                },
                child: Obx(() => components.slideSelector(
                    // searchController.searchTypesList
                    ['stores'.toString().tr + '(50)', 'items'.toString().tr + '(3)']
                    , searchController.selectedIndex.value)))
          ]),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < TempData.tempFoodItems.length; i++)
                  // FoodItemWidgetExpanded(
                  //     'Wendy\'s',
                  //     ImagesPath.uploadFileIcon,
                  //     24,
                  //     [
                  //       'Burgers',
                  //       'American (New)',
                  //       'Dinner',
                  //       'Sandwich',
                  //       'Burgers',
                  //     ],
                  //     4.1,
                  //     3000,
                  //     'Free Delivery'),
                FoodItemWidgetExpanded(
                    TempData.tempFoodItems[i]['label'],
                    TempData.tempFoodItems[i]['image'],
                      24,
                      [
                        'Burgers',
                        'American (New)',
                        'Dinner',
                        'Sandwich',
                        'Burgers',
                      ],
                      4.1,
                      3000,
                      'Free Delivery'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
