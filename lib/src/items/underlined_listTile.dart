import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';
class UnderLinedListTile extends StatelessWidget {
final String label;
final int totalItems;
final Widget page;
  UnderLinedListTile(this.label, this. totalItems, {this.page} );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (page !=null)
          Get.to(page);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Constants.FONT_GREY_COLOR.withOpacity(.5)))),
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: Constants.APP_HORIZONTAL_WIDTH),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Row(
                    children: [
                      Text('${totalItems??''}', style: TextStyle(color: Constants.FONT_GREY_COLOR)),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios, size: 20, color: Constants.FONT_GREY_COLOR)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
