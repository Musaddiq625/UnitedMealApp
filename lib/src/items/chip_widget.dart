import 'package:flutter/material.dart';

import '../const.dart';

class ChipWidget extends StatelessWidget {
  ChipWidget(this.label, {this.widgetList});

  final String label;
  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color:Constants.GREY_COLOR,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(label, textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
            if (widgetList != null)
              for (int i = 0; i < widgetList.length; i++) widgetList[i]
          ],
        ),
      ),
    );
  }
}
