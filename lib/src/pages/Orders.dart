import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/items/components.dart';

class Orders extends StatelessWidget {
  final Components components = Components();

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
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'no_previous_orders'.tr,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
