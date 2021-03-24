import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/items/components.dart';
import 'package:getx_app/src/items/food_item_bottomsheet.dart';

import '../../temp_data.dart';

class LiveMap extends StatelessWidget {
  final GlobalKey<ExpandableBottomSheetState> bottomSheetKey = new GlobalKey();
  final Components components = Components();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ExpandableBottomSheet(
          key: bottomSheetKey,
          persistentContentHeight: 150,
          background: GestureDetector(
            onTap: () {
              bottomSheetKey.currentState.contract();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey.withOpacity(.5),
              alignment: Alignment.center,
              child: Text('Map Here'),
            ),
          ),
          persistentHeader: Container(
            color: Colors.white,
            height: 50,
            child: Center(
              child: Container(
                height: 7,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          expandableContent: Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('heading_to_you'.tr, textScaleFactor: 2.2),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'arrives_in', style: TextStyle(color: Colors.black, fontSize: 14)),
                      TextSpan(text: ' 8 min', style: TextStyle(color: Colors.black, fontSize: 14)),
                    ]),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          )),
    ));
  }
}
