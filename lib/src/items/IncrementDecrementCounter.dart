import 'package:flutter/material.dart';

class IncrementDecrementCounter extends StatelessWidget {
  final int counterValue;
  final Function onIncrement, onDecrement;
  final Color leadingButtonColor, trailingButtonColor;

  IncrementDecrementCounter(this.counterValue, this.onIncrement, this.onDecrement,
      {this.leadingButtonColor = Colors.black, this.trailingButtonColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.5)),
          borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () => onDecrement(),
                child: Text('-', textScaleFactor: 2, style: TextStyle(color: leadingButtonColor))),
            Text('$counterValue',
                textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
                onTap: () => onIncrement(),
                child: Text('+', textScaleFactor: 2, style: TextStyle(color: trailingButtonColor))),
          ],
        ),
      ),
    );
  }
}
