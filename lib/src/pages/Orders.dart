import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/order.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/pages/order_details.dart';

class Orders extends StatelessWidget {
  final Components components = Components();
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();

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
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.APP_HORIZONTAL_WIDTH, vertical: 10),
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
                    StreamBuilder(
                  stream: firebaseFunctions.getAllOrdersStream(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Center(child: CircularProgressIndicator())
                        : snapshot.data.docs.isEmpty
                            ? Text(
                                'no_previous_orders'.tr,
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : Column(children: [
                                for (int i = 0; i < snapshot.data.docs.length; i++)
                                  Card(
                                    child: ListTile(
                                      onTap: () => Get.to(() =>
                                          OrderDetails(Order.toJson(snapshot.data.docs[i].data()))),
                                      title: Text(
                                        snapshot.data.docs[i].data()['restaurant_name'] ?? '',
                                        style: TextStyle(color: Constants.APP_COLOR),
                                      ),
                                      trailing: Text(
                                          '\$' +
                                              (snapshot.data.docs[i].data()['total'] ?? 0.0)
                                                  .toStringAsFixed(2),
                                          textScaleFactor: 1.1,
                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          Order.timeStampToDate(
                                                  snapshot.data.docs[i].data()['order_date']) +
                                              ', ' +
                                              Order.timeStampToTime(
                                                  snapshot.data.docs[i].data()['order_date']),
                                          textScaleFactor: 0.9),
                                    ),
                                  )
                              ]);
                  },
                )),
          ),
        )
      ],
    );
  }
}
