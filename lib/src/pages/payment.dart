import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/const.dart';
import 'package:getx_app/src/items/components.dart';

class Payment extends StatelessWidget {
  final Components components = Components();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          components.textWithWidget('payment'.tr),
          SizedBox(height: 70),
          components.textWithWidget('add_payment_method'.tr, fontSize: 10),
          SizedBox(height: 40),
          components.textWithWidget('credit_debit_card'.tr,
              fontSize: 8, leadingIcon: Icon(Icons.credit_card), isBold: false),
          SizedBox(height: 5),
          components.myDivider(),
          SizedBox(height: 5),
          components.textWithWidget('pay_pal'.tr,
              fontSize: 8, leadingIcon: Icon(Icons.credit_card), isBold: false),
          SizedBox(height: 40),
          components.textWithWidget('door_dash_credits'.tr, fontSize: 10),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: Text(
              'your_usd_credit_will_be_automatically_applied_to_your_next_order'.tr,
              softWrap: true,
            ),
          ),
          components.myDivider(),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: components.textWithWidget('\$0.00 ' + 'usd'.tr,
                fontSize: 8,
                addPadding: false,
                iconData: Icons.keyboard_arrow_right,
                inCircleAvatar: false,
                subTitleText: 'can_be_applied_only_in_usa'.tr,
                onTapNavigateTo: Payment()),
          ),
          SizedBox(height: 5),
          components.myDivider(),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: components.textWithWidget('redeem_gift_card'.tr,
                fontSize: 8,
                addPadding: false,
                iconData: Icons.keyboard_arrow_right,
                inCircleAvatar: false),
          ),
          SizedBox(height: 5),
          components.myDivider(),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.APP_HORIZONTAL_WIDTH),
            child: components.textWithWidget('invite_friends_on_earn_credits'.tr,
                fontSize: 8,
                addPadding: false,
                iconData: Icons.keyboard_arrow_right,
                inCircleAvatar: false,),
          ),
          SizedBox(height: 5),
          components.myDivider(),
          SizedBox(height: 5),
        ],
      ),
    )));
  }
}
