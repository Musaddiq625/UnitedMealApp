import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../const.dart';

class Components {
  textWithWidget(
    String label, {
    int fontSize = 12,
    bool isBold = true,
    Color fontColor = Colors.black,
    IconData iconData,
    bool inCircleAvatar = true,
    Function onPressedWidget,
    bool isCapital = false,
    bool addPadding = true,
    Widget onTapNavigateTo,
    String subTitleText,
    Color subFontColor = Colors.black,
    Widget leadingIcon,
  }) {
    return GestureDetector(
      onTap: () {
        if (onTapNavigateTo != null) {
          Get.off(() => onTapNavigateTo);
        } else
          print('navigation is null');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: addPadding ? Constants.APP_HORIZONTAL_WIDTH : 0),
        child: Container(
          child: Row(
            children: [
              if (leadingIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: leadingIcon,
                ),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isCapital ? label.toUpperCase() : label,
                        textScaleFactor: 2.2,
                        style: TextStyle(
                            color: fontColor,
                            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                            fontSize: fontSize.toDouble()),
                      ),
                      subTitleText == null
                          ? Container()
                          : Text(
                              subTitleText,
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                color: subFontColor,
                              ),
                            ),
                    ],
                  )),
              iconData == null
                  ? Container()
                  : Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (onPressedWidget != null) onPressedWidget();
                        },
                        child: inCircleAvatar
                            ? CircleAvatar(
                                radius: 18,
                                foregroundColor: Colors.black,
                                backgroundColor: Constants.GREY_COLOR,
                                child: Icon(iconData, size: 18),
                              )
                            : Icon(iconData),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  textWithSwitch(
    String label, {
    int fontSize = 12,
    bool isCapital = false,
    bool switchValue = false,
    Function onChangedSwitch,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Text(
                isCapital ? label.toUpperCase() : label,
                style: TextStyle(fontSize: fontSize.toDouble()),
              )),
          CupertinoSwitch(
              value: switchValue, onChanged: (updatedValue) => onChangedSwitch(updatedValue)),
        ],
      ),
    );
  }

  searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1), borderRadius: BorderRadius.circular(15)),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.black),
          ),
        ),
      ),
    );
  }

  myTextChip(String label, {isSelected = false, isExpanded = false}) => GestureDetector(
        child: Container(
          // height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(50)),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

          child: Text(label,
              textScaleFactor: 1.1,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
        ),
      );

  myDivider() => Divider(color: Colors.grey, thickness: 0.3);

  slideSelector(List<String> stringList, int selectedItemIndex) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration:
              BoxDecoration(color: Constants.GREY_COLOR, borderRadius: BorderRadius.circular(50)),
          child: Row(
            children: [
              for (int i = 0; i < stringList.length; i++)
                Expanded(child: myTextChip(stringList[i], isSelected: i == selectedItemIndex))
            ],
          ),
        )
      ],
    );
  }

  roundButton(String label, Function onButtonPressed, {IconData leadingIcon}) {
    return GestureDetector(
      onTap: () => onButtonPressed(),
      child: Container(
        decoration: BoxDecoration(
            color: Constants.APP_COLOR.withOpacity(.1), borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Wrap(

          children: [
            Icon(leadingIcon,size:leadingIcon==null?0:22,color: Constants.APP_COLOR),
            Text(
              leadingIcon==null?label:'  '+
              label,
              textScaleFactor: 1.3,
              style: TextStyle(color: Constants.APP_COLOR, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
