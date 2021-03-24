import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function function;
  final Color btnColor, fontColor;
  final String trailingText;

  ButtonWidget(
    this.label, {
    this.function,
    this.btnColor = Constants.APP_COLOR,
    this.fontColor = Constants.TEXT_WHITE_COLOR,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(color: btnColor, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child:
        trailingText==null?
        Text(
          label,
          textScaleFactor: 1.2,
          style: TextStyle(color: fontColor),
        ):
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Center(
              child: Text(
                label,
                textScaleFactor: 1.2,
                style: TextStyle(color: fontColor),
              ),
            ),

            Text(
              trailingText??'',
              textScaleFactor: 1.2,
              style: TextStyle(color: Constants.TEXT_WHITE_COLOR),
            ),
          ],
        )



      ),
    );
  }
}
