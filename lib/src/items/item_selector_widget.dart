import 'package:flutter/material.dart';
import 'package:getx_app/src/const.dart';

class ItemSelectorWidget extends StatelessWidget {
  final String item1, item2;
  final int selectedIndex;
final Function onChange;
  ItemSelectorWidget(this.item1, this.item2, this.selectedIndex, this.onChange);

  itemBox(int index,String label, bool isSelected){
    return GestureDetector(
      onTap: ()=>onChange(index),
      child: Container(
          decoration: BoxDecoration(
            color: isSelected?Constants.APP_COLOR:Colors.white,
              border: Border.all(color: Constants.APP_COLOR)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Text(label, style: TextStyle(color:
            isSelected?Colors.white:
            Constants.APP_COLOR)),
          )),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        itemBox(0, item1,selectedIndex==0),
        itemBox(1, item2,selectedIndex==1),

    ],
    );
  }
}
