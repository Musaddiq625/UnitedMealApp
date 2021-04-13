import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/cart_controller.dart';
import 'package:getx_app/src/controllers/food_controller.dart';
import 'package:getx_app/src/items/chip_widget.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/items/cuisines_slider.dart';
import 'package:getx_app/src/items/featured_ads_slider.dart';
import 'package:getx_app/src/items/items_slider_full.dart';
import 'package:getx_app/src/items/top_bar_delivering_to.dart';
import 'package:getx_app/src/pages/account_bottomsheet.dart';

import 'cart.dart';

class Home extends StatelessWidget {
  final Components components = Components();
  final FoodController foodController = Get.put(FoodController());
  final CartController cartController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopBarDeliveringTo(
               () {
                Get.bottomSheet(Account(),isScrollControlled: true);
              },
                  () {
                Get.to(()=>CartPage(''));
              }
            ),
            CuisinesSlider(),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChipWidget(
                    'pickup'.tr,
                  ),
                  ChipWidget(
                    '${'over'.tr} 4.5',
                    widgetList: [
                      SizedBox(width: 3),
                      Icon(Icons.star, size: 18),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Container(height: 18, width: 1.5, color: Colors.black)),
                      Icon(Icons.keyboard_arrow_down_sharp, size: 19),
                    ],
                  ),
                  ChipWidget('${'under'.tr} 30 ${'min'.tr}'),
                  ChipWidget('pickup'.tr),
                ],
              ),
            ),
            SizedBox(height: 10),
            FeaturedAdsSlider(),
            SizedBox(height: 10),
            components.textWithWidget('convenience_grocery_more'.tr,
                iconData: Icons.arrow_forward),
            SizedBox(height: 10),
            ImagesSliderFull(foodController.firebaseFunctions/*'temp_name'.tr, 'temp_time_in_min'.tr, 'Free Delivery'*/),
            SizedBox(height: 10),
            ///
            FeaturedAdsSlider(),
            SizedBox(height: 10),
            components.textWithWidget('convenience_grocery_more'.tr,
                iconData: Icons.arrow_forward),
            SizedBox(height: 10),
            ImagesSliderFull(foodController.firebaseFunctions),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
