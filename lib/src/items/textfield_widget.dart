import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  TextFieldWidget(this.controller, {this.hintText = '', this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          obscureText: isObscure??false,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: isObscure==null?Container():Icon(isObscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey)),
        ),
      ),
    );
  }
}
