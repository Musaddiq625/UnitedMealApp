import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/order.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/cart_controller.dart';
import 'package:getx_app/src/controllers/checkout_controller.dart';
import 'package:getx_app/src/controllers/user_controller.dart';
import 'package:getx_app/src/items/button_widget.dart';
import 'package:getx_app/src/items/underlined_listTile.dart';
import 'package:intl/intl.dart';

class Checkout extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  final UserController userController = Get.find();
  final CartController cartController = Get.find();
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();
  DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < cartController.cartItems.length; i++)
      print(cartController.cartItems[i].food.toMap());
    return SafeArea(
        child: Scaffold(
            body: Obx(() => Stack(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.APP_HORIZONTAL_WIDTH, vertical: 10),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Stack(alignment: Alignment.center, children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.arrow_back_ios, color: Constants.APP_COLOR),
                                      Text('my_cart'.tr,
                                          style: TextStyle(color: Constants.APP_COLOR)),
                                    ],
                                  ),
                                ),
                              ),
                              Text('checkout'.tr,
                                  textScaleFactor: 1.5,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                            SizedBox(height: 20),
                            Text('delivery_details'.tr.toUpperCase(),
                                textScaleFactor: 1.2,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 15),
                            Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(10))),
                          ]),
                        ),
                        SizedBox(height: 15),
                        UnderLinedListTile('address'.tr, userController.user.address),
                        UnderLinedListTile('delivery_instruction'.tr, 'abc 123'),
                        UnderLinedListTile('eta'.tr, 'abc 123'),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.APP_HORIZONTAL_WIDTH),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('payment'.tr.toUpperCase(),
                                  textScaleFactor: 1.2,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('dasher_tip'.tr),
                                  Obx(
                                    () => Text('\$${checkoutController.selectedDasherTip.value}',
                                        style: TextStyle(color: Constants.FONT_GREY_COLOR)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Obx(() => Row(children: [
                                    for (int i = 0;
                                        i < checkoutController.dasherTipsList.length;
                                        i++)
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            checkoutController
                                                .changeTip(checkoutController.dasherTipsList[i]);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: checkoutController.dasherTipsList[i] ==
                                                        checkoutController.selectedDasherTip.value
                                                    ? Constants.APP_COLOR
                                                    : Colors.white,
                                                border: Border.all(color: Constants.APP_COLOR)),
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: Text(
                                              '\$${checkoutController.dasherTipsList[i].toInt()}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: checkoutController.dasherTipsList[i] ==
                                                          checkoutController.selectedDasherTip.value
                                                      ? Colors.white
                                                      : Constants.APP_COLOR,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                  ])),
                              SizedBox(height: 20),
                              UnderLinedListTile('payment'.tr, 'apple_pay'.tr),
                              SizedBox(height: 100),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonWidget('buy_with_pay'.tr,
                                      btnColor: Colors.black,
                                      fontColor: Colors.white, function: () {
                                    checkoutController.startPaymentProcess();
                                    for (int i = 0; i < cartController.cartItems.length; i++)
                                      print(cartController.cartItems[i].food.toMap());

                                    // firebaseFunctions.addOrder(Order(
                                    //   _dateFormat.format(DateTime.now()),
                                    //   20,
                                    //   10,
                                    //   cartController.getTotalPriceOfCartItems,
                                    //   cartController.getTotalPriceOfCartItemsWithAllCharges,
                                    //   userController.user.id,
                                    //   userController.user.name,
                                    //
                                    //   'HaZCfCEXUri5JcnLoqE8',
                                    //   'Mantra Restaurant',
                                    //   Restaurant(
                                    //     name: 'Mantra Restaurant',
                                    //     imagePath: '',
                                    //     address: '',
                                    //     latitude: 1.1,
                                    //     longitude: 2.2,
                                    //     ratings: 2.6,
                                    //     cuisines: ['cuisine1'],
                                    //   ),
                                    //   2,
                                    //   [
                                    //     for (int i = 0; i < cartController.cartItems.length; i++)
                                    //       Food().toModel(cartController.cartItems[i].food.toMap())
                                    //   ],
                                    // ));

                                    // Order({ this.deliveryFee,
                                    //   this.feeAndTaxes,
                                    //   this.subtotal,
                                    //   this.total,
                                    //   this.userId,
                                    //   this.userName,
                                    //   this.restaurantId,
                                    //   this.restaurantName,});
                                    firebaseFunctions.addOrder(Order(
                                      deliveryFee: 0,
                                      feeAndTaxes: cartController.tempTax,
                                      subtotal: cartController.getTotalPriceOfCartItems,
                                      total: cartController.getTotalPriceOfCartItemsWithAllCharges,restaurantName: cartController.cartItems[0].restaurantName,
                                      restaurantId: cartController.cartItems[0].restaurantId,
                                      userId: userController.user.id,
                                      userName: userController.user.name
                                    ));
                                    cartController.cartItems.clear();

                                  }),
                                ],
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        )
                      ],
                    )),
                    !checkoutController.isPaying.value
                        ? Container()
                        : Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Colors.black.withOpacity(.9),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('processing_order'.tr,
                                          textScaleFactor: 1.5,
                                          style: TextStyle(color: Colors.white)),
                                      CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(Colors.white))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ))));
  }
}
