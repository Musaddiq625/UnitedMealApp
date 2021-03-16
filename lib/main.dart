import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/controllers/home_controller.dart';
import 'package:getx_app/translations/translations.dart';
import 'src/pages/splash_screen.dart';

void main() {
  // Get.lazyPut(() => Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    // translations: Messages(),
    // locale: Locale('en'),
    return GetMaterialApp(
      // translations: Messages(),
      translations: MyTranslations(),
      locale: Locale('en'),

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: 'Poppins'
        // fontFamily: 'STC'
        fontFamily: 'ProductSans'
      ),
      home: SplashScreen(),
    );
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider.value(
      //       value: Counter(),
      //     ),
      //   ],
      //   child: GetMaterialApp(
      //     translations: Messages(),
      //     locale: Locale('en'),
      //     title: 'Flutter Demo',
      //     theme: ThemeData(
      //       primarySwatch: Colors.blue,
      //     ),
      //     home: MyProviderPage(),
      //   ));
  }
}

// class MyGetX extends StatelessWidget {
//   // final userController = Get.put(UserController());
//   // static UserController get to => Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('title'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text('hello'.tr),
//             // GetBuilder<UserController>(
//             //     init: UserController(), builder: (_) =>
//             //     Text('New Value: ${UserController.to.counter}')
//             // )
//
//             // Obx(()=> Text(
//             //   userController.count.value.toString(),
//             //   style: Theme.of(context).textTheme.headline4,
//             // ))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: userController.incrementValue,
//         // onPressed: () => Get.to(SecondPage()),
//         onPressed: () {
//           // UserController.to.incrementValue();
//           var locale = Locale('es');
//           GetSocket a() {}
//           Get.updateLocale(locale);
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class MyWebSocket extends GetView<UserController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Websocket test'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextField(
//               onChanged: (val) => controller.text = val,
//               decoration: InputDecoration(labelText: 'Send a message'),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 24.0),
//               child: controller.call(
//                 (state) => Text(state),
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => controller.sendMessage('hellooooo'),
//         tooltip: 'Send message',
//         child: Icon(Icons.send),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class MyProviderPage extends StatelessWidget {
// final userController = Get.put(UserController());
//
//   void _incrementCounter(BuildContext context) {
//     Provider.of<Counter>(context, listen: false).incrementCounter();
//     userController.incrementValue();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var counter = Provider.of<Counter>(context).getCounter;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Testing Provider'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Provider - You have pushed the button this many times:',
//             ),
//             Obx(()=> Text(
//              'GetX'+ userController.count.value.toString(),
//               style: Theme.of(context).textTheme.headline4,
//             )),
//             Text(
//               'Provider: $counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _incrementCounter(context),
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
