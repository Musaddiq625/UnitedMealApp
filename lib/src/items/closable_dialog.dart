import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/src/images_path.dart';

import '../const.dart';

class ClosableWidget extends StatefulWidget {
  @override
  _ClosableWidgetState createState() => _ClosableWidgetState();
}

class _ClosableWidgetState extends State<ClosableWidget> {
  bool hideWidget = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
            height:  hideWidget?0:300,
            duration: Duration(milliseconds: 300),
            child: hideWidget?Container(): Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                color: Constants.GREY_COLOR,
                width: double.infinity,
                child: Stack(
                  children: [
                    Center(
                      child: Column(

                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(ImagesPath.uploadFileIcon)),
                          ),
                          SizedBox(height: 12),
                          Center(
                            child: Text('introducing_offers'.tr,
                                textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 7),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text('introducing_offers_details'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:hideWidget ? Container(): GestureDetector(
                          onTap: () => setState(() => hideWidget = true), child: Icon(Icons.close)),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
