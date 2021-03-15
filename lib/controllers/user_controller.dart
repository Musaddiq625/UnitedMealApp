// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:getx_app/models/user.dart';
//
// class UserController
// extends GetxController
//     // extends  GetNotifier
// {
//   RxInt count = 0.obs;
//   // int counter = 0;
//
//   // UserController(initial) : super(initial);
//   // static UserController get to => Get.find();
//   final emailController = TextEditingController();
//    final passwordController = TextEditingController();
//    loginUser(){
//      print('emailController.text ${emailController.text}');
//      print('passwordController.text ${passwordController.text}');
//    }
//    incrementValue(){
//      count++;
//      // counter++;
//      // update();
//    }
//
//   //  //////////////////
//   // GetSocket socket = GetSocket("wss://echo.websocket.org'");
//   // String text = '';
//   //
//   // UserController(initial) : super(initial);
//   //
//   // @override
//   // void onInit() {
//   //   print('onInit called');
//   //
//   //   socket.onOpen(() {
//   //     print('onOpen');
//   //     // change(value, status: RxStatus.success());
//   //   });
//   //
//   //   socket.onMessage((data) {
//   //     print('message received: $data');
//   //     // change(data);
//   //   });
//   //
//   //   socket.onClose((close) {
//   //     print('close called');
//   //     // change(value, status: RxStatus.error(close.message));
//   //   });
//   //
//   //   socket.onError((e) {
//   //     print('error called');
//   //     // change(value, status: RxStatus.error(e.message));
//   //   });
//   //
//   //   socket.on('event', (val) {
//   //     print(val);
//   //   });
//   //
//   //   socket.emit('event', 'you data');
//   //
//   //   socket.connect();
//   // }void sendMessage(String text) {
//   //   if (text.isNotEmpty) {
//   //     socket.emit('message', text);
//   //   }
//   // }
// }