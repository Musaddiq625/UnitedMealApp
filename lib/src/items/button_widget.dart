import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';
class ButtonWidget extends StatelessWidget {
  final String label;
  final Function function;
  ButtonWidget(this.label, {this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>function(),
      child: Container(
        decoration: BoxDecoration(
          color: Constants.APP_COLOR,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
        child: Text(label,
          textScaleFactor: 1.2,
          style: TextStyle(color: Constants.TEXT_WHITE_COLOR),),
      ),
    );
  }
}
