import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';

class UnderLinedListTile extends StatelessWidget {
  final String label;
  final String totalItems;
  final Widget page;

  UnderLinedListTile(this.label, this.totalItems, {this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (page != null)
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
              Expanded(
                  child: Text(label,
                      textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                flex: 3,
                child: Row(

                  children: [
                    Expanded(
                      child: Text('${totalItems ?? ''}',
                          textAlign: TextAlign.end,
                          maxLines: null,
                          softWrap: true,
                          style: TextStyle(color: Constants.FONT_GREY_COLOR)),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios,
                        size: 20, color: Constants.FONT_GREY_COLOR)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
