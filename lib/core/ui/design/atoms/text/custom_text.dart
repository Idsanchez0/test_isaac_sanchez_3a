import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final double fontSize;
  final double? height;
  final TextDecoration? decoration;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.title,
    required this.fontSize,
    required this.color,
    required this.align,
    required this.fontWeight,
    this.height,
    this.decoration,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: color,
        height: height ?? 1.5,
      ),
    );
  }
}
