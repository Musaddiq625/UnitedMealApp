import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';

class ButtonWidgetRound extends StatelessWidget {
  final String label;
  final Function function;
  final Color btnColor, fontColor;
final int radius;
final String trailingText;
  ButtonWidgetRound(this.label,
      {this.function,
      this.btnColor = Constants.APP_COLOR,
      this.fontColor = Constants.TEXT_WHITE_COLOR,this.radius=10, this.trailingText = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(color: btnColor, borderRadius: BorderRadius.circular(radius.toDouble())),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        alignment: Alignment.center,
        child: Stack(
alignment: Alignment.center,
          children: [
            Text(
              label,
              textScaleFactor: 1.3,
              style: TextStyle(color: fontColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text(trailingText,
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Constants.TEXT_WHITE_COLOR))
            ],)

          ],
        ),
      ),
    );
  }
}
