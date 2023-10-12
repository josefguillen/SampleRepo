import 'package:flutter/material.dart';

class EditTextWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final double? width;
  final double? height;

  const EditTextWidget({
    this.controller,
    this.hintText,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
