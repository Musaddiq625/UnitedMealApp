import 'package:get/get.dart';
import 'package:getx_app/models/order.dart';
import 'package:getx_app/src/pages/live_map.dart';

import 'cart_controller.dart';

class CheckoutController extends GetxController {
  RxBool isPaying = false.obs;
  RxString selectedAddress = ''.obs;
  RxString selectedDeliveryInstruction = ''.obs;
  RxString selectedETA = ''.obs;
  RxDouble selectedDasherTip = 3.0.obs;
  List<double> dasherTipsList = [3.0, 4.0, 5.0];
  final CartController cartController = Get.find();

  changeTip(double newTip) {
    selectedDasherTip.value = newTip;
  }

  startPaymentProcess() {
    isPaying.value = true;
    Future.delayed(Duration(seconds: 2)).then((value) {
      isPaying.value = false;
      Get.to(LiveMap());
    });
  }
  uploadCart(){

  }
  orderData(Order order){
    print(order.toMap().toString());
  }
}
