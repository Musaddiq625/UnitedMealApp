import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';
import 'package:get/get.dart';

class TopBarDeliveringTo extends StatelessWidget {
  final Function  onTapFunction;
  TopBarDeliveringTo({this.onTapFunction});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), offset: Offset(1, 1.5))]),
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap:()=>onTapFunction(),
            child: Icon(Icons.person_outline)),
        Column(
          children: [
            Text(
              'delivering_to'.tr,
              style: TextStyle(color: Constants.APP_COLOR, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '10016',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Constants.APP_COLOR)
              ],
            )
          ],
        ),
        Text('')
      ]),
    );
  }
}
