import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../atoms/text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color border;
  final String text;
  final Color colorText;
  final double radius;
  final double? sizeText;
  final double? width;

  const CustomButton({
    super.key,
    required this.color,
    required this.colorText,
    required this.text,
    required this.radius,
    this.sizeText,
    this.width,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: border),
        borderRadius: BorderRadius.all(Radius.circular(radius.sp)),
      ),
      alignment: Alignment.center,
      child: CustomText(
        title: text,
        fontSize: sizeText ?? 14,
        color: colorText,
        height: 1.5,
        align: TextAlign.center,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
