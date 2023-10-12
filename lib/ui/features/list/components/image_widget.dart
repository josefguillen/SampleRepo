import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const ImageWidget({
    required this.url,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        url,
      ),
    );
  }
}
