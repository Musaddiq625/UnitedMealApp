import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';

class ActivePoints extends StatelessWidget {
  final int totalDots, currentIndex;

  ActivePoints(this.totalDots, this.currentIndex);

  @override
  Widget build(BuildContext context) {
    print('currentIndex $currentIndex');
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < totalDots; i++)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: currentIndex == i ? Constants.APP_COLOR : Constants.APP_COLOR.withOpacity(.12),
                      shape: BoxShape.circle)),
            )
        ],
      ),
    );
  }
}
