import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';
class ButtonWidget extends StatelessWidget {
  final String label;
  final Function function;
  final Color btnColor, fontColor;
  ButtonWidget(this.label, {this.function, this.btnColor =  Constants.APP_COLOR, this.fontColor = Constants.TEXT_WHITE_COLOR});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>function(),
      child: Container(
        decoration: BoxDecoration(
          color:btnColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
        child: Text(label,
          textScaleFactor: 1.2,
          style: TextStyle(color: fontColor),),
      ),
    );
  }
}
