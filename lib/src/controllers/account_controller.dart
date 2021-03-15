import 'package:get/get.dart';

class AccountController extends GetxController {
  RxBool deliveryPushNotificationsEnabled = false.obs,
      deliverySMSNotificationsEnabled = false.obs,
      promotionalPushNotificationsEnabled = false.obs;

  changePushNotificationsValue(bool updatedValue) =>
      deliveryPushNotificationsEnabled.value = updatedValue;

  changeDeliverySMSNotificationValue(bool updatedValue) =>
      deliverySMSNotificationsEnabled.value = updatedValue;

  changePromotionalPushNotificationsValue(bool updatedValue) =>
      promotionalPushNotificationsEnabled.value = updatedValue;
}
