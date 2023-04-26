import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final bool? isDes;

  const AppTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.isDes = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      minLines: isDes! ? 4 : 1,
      maxLines: isDes! ? 4 : 1,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFFF97B1),
          ),
        ),
      ),
      cursorColor: Colors.cyan,
    );
  }
}
