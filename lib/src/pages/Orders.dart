import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:intl/intl.dart';

class Orders extends StatelessWidget {
  final Components components = Components();
  final FirebaseFunctions firebaseFunctions =FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        components.textWithWidget('orders'.tr),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
              child:
              // Column(
              //   children: [
              //     SizedBox(height: 10),
              //     Text(
              //       'no_previous_orders'.tr,
              //       textScaleFactor: 1.3,
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              StreamBuilder(stream:firebaseFunctions.getAllOrdersStream(),builder: (context, snapshot){

                return !snapshot.hasData
                    ? CircularProgressIndicator()
                    : Column(children: [
                  for(int i=0;i<snapshot.data.docs.length;i++)
                    Card(
                      child: ListTile(title: Text(snapshot.data.docs[i].data()['resturant_name']??'',style: TextStyle(color: Colors.black),),subtitle:
                      Text(DateFormat('dd-MM-yyyy').format((snapshot.data.docs[i].data()['order_date']as Timestamp ).toDate())),),
                    )
                ]);
              },)
            ),
          ),
        )
      ],
    );
  }
}
