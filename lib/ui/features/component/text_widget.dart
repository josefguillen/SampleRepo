import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String str;
  final double? width;
  final double? height;

  const TextWidget({
    required this.str,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(
        str,
      ),
    );
  }
}
