import 'package:flutter/material.dart';
class TextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  TextFieldWidget(this.controller, {this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,

          decoration: InputDecoration(border: InputBorder.none,hintText: hintText??''),
        ),
      ),
    );
  }
}
