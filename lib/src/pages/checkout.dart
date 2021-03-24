import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/controllers/checkout_controller.dart';
import 'package:getx_app/src/items/button_widget.dart';
import 'package:getx_app/src/items/underlined_listTile.dart';

class Checkout extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            body: Obx(()=>Stack(

              children: [
                SingleChildScrollView(
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH, vertical: 10),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back_ios, color: Constants.APP_COLOR),
                                    Text('my_cart'.tr, style: TextStyle(color: Constants.APP_COLOR)),
                                  ],
                                ),
                              ),
                              Text('checkout'.tr,
                                  textScaleFactor: 1.5,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                            SizedBox(height: 20),
                            Text('delivery_details'.tr.toUpperCase(),
                                textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 15),
                            Container(height: 100,width: double.infinity,

                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(10))),

                          ]),
                        ),
                        SizedBox(height: 15),
                        UnderLinedListTile('address'.tr, 'abc 123'),
                        UnderLinedListTile('delivery_instruction'.tr, 'abc 123'),
                        UnderLinedListTile('eta'.tr, 'abc 123'),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('payment'.tr.toUpperCase(),
                                  textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('dasher_tip'.tr),
                                  Text('\$4.00',style: TextStyle(color: Constants.FONT_GREY_COLOR)),

                                ],),
                              SizedBox(height: 15),
                              Obx(()=> Row(children: [
                                for(int i=0;i<checkoutController.dasherTipsList.length;i++)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        checkoutController.changeTip(checkoutController.dasherTipsList[i]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: checkoutController.dasherTipsList[i]==
                                                checkoutController.selectedDasherTip.value?Constants.APP_COLOR: Colors.white ,

                                            border: Border.all(color: Constants.APP_COLOR)),
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        child: Text('\$${checkoutController.dasherTipsList[i].toInt()}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: checkoutController.dasherTipsList[i]==
                                                  checkoutController.selectedDasherTip.value? Colors.white :Constants.APP_COLOR,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  )
                              ])),
                              SizedBox(height: 20),
                              UnderLinedListTile('payment'.tr, 'apple_pay'.tr),
                              SizedBox(height: 120),
                              ButtonWidget('buy_with_pay'.tr,
                                btnColor: Colors.black,fontColor: Colors.white,
                                function: (){
                                  checkoutController.startPaymentProcess();
                                },)
                            ],
                          ),
                        )
                      ],
                    )),

                !checkoutController.isPaying.value?Container():
                Container(height: double.infinity,width: double.infinity,
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
                            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))
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
