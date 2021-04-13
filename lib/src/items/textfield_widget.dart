import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure,isPasswordField;
final Function onPressed;
  TextFieldWidget(this.controller, {this.hintText = '', this.isObscure=false,this.isPasswordField = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon:GestureDetector(
                onTap: ()=>onPressed(),
                child: !isPasswordField?Container(height: 0,width: 0) : Icon(isObscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey),
              )),
        ),
      ),
    );
  }
}
