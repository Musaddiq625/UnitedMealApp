import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';

class AppBarWidget extends StatelessWidget {
  final IconData leadingIcon, trailingIcon;
  final Widget leadingWidget, trailingWidget;
  final String title;

  AppBarWidget(this.leadingIcon, this.trailingIcon,
      {this.leadingWidget, this.trailingWidget, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          leadingIcon == null ? leadingWidget : Icon(leadingIcon, color: Constants.APP_COLOR),
          Text(title ?? '', textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
          trailingIcon == null ? trailingWidget : Icon(trailingIcon, color: Constants.APP_COLOR),
        ]));
  }
}
