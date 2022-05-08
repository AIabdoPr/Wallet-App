import 'package:flutter/material.dart';

class UserImageView extends StatelessWidget {
  final EdgeInsets margin, padding;
  final Color? backgroundColor;
  final Image image;
  final double size;

  const UserImageView(
    this.image, {
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(2.5),
    this.backgroundColor,
    this.size = 120,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size * 0.7),
      ),
      child: image,
    );
  }
}
