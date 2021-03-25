import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/items/cart_item.dart';
import 'package:getx_app/temp_data.dart';
import '../items/button_widget_round.dart';
import 'checkout.dart';

class CartPage extends StatelessWidget {
  final String shopName;

  CartPage(this.shopName);

  @override
  Widget build(BuildContext context) {
    cartItemBox(String totalPCs, Food foodModel) {
      return Container(
        width: 280,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(.5)),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodModel?.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    '\$${foodModel?.price}',
                    textScaleFactor: 0.9,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Container(
                  height: 40,
                  width: 65,
                  child: Image.asset(
                    foodModel.imagePath,
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close)),
              Text(
                shopName,
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.group_add)
            ]),
          ),
          Container(
            width: double.infinity,
            color: Constants.TEXT_BG_COLOR,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            child: Text(
              'you_saved'.tr + ' \$0.49 ' + 'with_new_user_promotion'.tr,
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: Column(children: [
              SizedBox(height: 30),
              Row(children: [
                Text('items'.tr,
                    textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              SizedBox(height: 30),
              for (int i = 0; i < 2; i++)
                CartItem(i + 1, TempData.tempRestaurantsWithFoods[0].restaurantFoods[i]),
              SizedBox(height: 12),
              Row(children: [
                SizedBox(width: 20),
                Text('add_more_items'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Constants.APP_COLOR))
              ]),
              SizedBox(height: 50),
              Row(children: [
                Text('people_also_ordered'.tr,
                    textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: cartItemBox(
                          '10 PC', TempData.tempRestaurantsWithFoods[0].restaurantFoods[0])),
                  cartItemBox('10 PC', TempData.tempRestaurantsWithFoods[0].restaurantFoods[0]),
                ]),
              )
            ]),
          ),
          SizedBox(height: 15),
          Container(
            height: 7,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                border: Border(bottom: BorderSide(color: Colors.black54, width: .2))),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('total'.tr,
                    textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey, width: .5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('promo_code'.tr),
                      Icon(Icons.keyboard_arrow_right, color: Constants.GREY_COLOR)
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('subtotal'.tr,
                        textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$5.24',
                        textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('delivery_fee'.tr,
                            textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        Icon(Icons.info_outline, color: Colors.grey, size: 20)
                      ],
                    ),
                    Row(children: [
                      Text('\$0.49',
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Text('\$0.00',
                          textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                    ])
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text('fees_and_estimated_tax'.tr,
                          textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Icon(Icons.info_outline, color: Colors.grey, size: 20)
                    ]),
                    Text('\$3.75',
                        textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(height: 1, width: double.infinity, color: Colors.grey.withOpacity(.5)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonWidgetRound(
              'continue'.toString().tr,
              radius: 30,
              btnColor: Constants.APP_DARK_COLOR,
              trailingText: '\$8.99',
              function: () {
                Get.to(()=>Checkout());
              },
            ),
          ),
          SizedBox(height: 20),
        ])),
      ),
    );
  }
}
