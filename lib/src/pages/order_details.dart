import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/order.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatelessWidget {
  final Order orderDetails;

  OrderDetails(this.orderDetails);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      width: double.infinity,
                      // padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
                      child: Container(
                        height: 300,
                        width: Get.width,
                        color: Colors.black54,
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Text(orderDetails.restaurantName.toString(),
                            textScaleFactor: 2,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(height: 20),
                      Text('order_details'.tr,
                          textScaleFactor: 1.5,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Expanded(child: Text('order_no'.tr+':',style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(flex: 2, child: Text(orderDetails.id,textAlign: TextAlign.end))
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Expanded(child: Text('order_from'.tr+':',style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(flex: 2, child: Text(orderDetails.restaurantName,textAlign: TextAlign.end))
                      ]),
                      SizedBox(height: 10),  Row(children: [
                        Expanded(child: Text('delivery_address'.tr+':',style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(flex: 2, child: Text('somewhere from earth',textAlign: TextAlign.end))
                      ]),
                      SizedBox(height: 10), Row(children: [
                        Expanded(child: Text('order_date'.tr+':',style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(flex: 2, child: Text(Order.timeStampToDate(orderDetails.orderDate),textAlign: TextAlign.end))
                      ]),
                      SizedBox(height: 10),
                          Divider(),
                         Column(children: [
                           for(int i=0;i<3;i++)
                             Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                               SizedBox(height: 10),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                 Text('x${i+1}',
                                     textScaleFactor: 1.05,
                                     style: TextStyle(fontWeight: FontWeight.bold)),
                                 SizedBox(width: 15),
                                 Expanded(flex: 2,child: Text('Food$i'.tr,style: TextStyle(fontWeight: FontWeight.bold))),
                                 Expanded(flex: 2, child: Text('\$'+(orderDetails.subtotal*(i+1)).toString(),textAlign: TextAlign.end))
                               ]),
                               SizedBox(height: 10)
                             ])
                         ]),
                          Divider(),
                          SizedBox(height: 10),
                          Row(children: [
                            Expanded(child: Text('subtotal'.tr+':',style: TextStyle(fontWeight: FontWeight.bold))),
                            Expanded(flex: 2, child: Text('\$'+orderDetails.subtotal.toString(),textAlign: TextAlign.end))
                          ]),
 SizedBox(height: 10),
                          Row(children: [
                            Expanded(child: Text('delivery_fee'.tr+':',style: TextStyle(fontWeight: FontWeight.bold))),
                            Expanded(flex: 2, child: Text('\$'+orderDetails.deliveryFee.toString(),textAlign: TextAlign.end))
                          ]),SizedBox(height: 15),



                    ]),
                  ),
                  Container(
                    color: Colors.grey.withOpacity(.3),
                    padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH,vertical: Constants.APP_HORIZONTAL_WIDTH),
                    child: Row(children: [
                      Expanded(child: Text('total'.tr+':',
                          textScaleFactor: 1.2,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 2, child: Text('\$'+orderDetails.total.toString(),textScaleFactor: 1.2,textAlign: TextAlign.end))
                    ]),
                  ),
                ],
              ),
              BackButton()
            ],
          ),
        ),
      ),
    );
  }
}
