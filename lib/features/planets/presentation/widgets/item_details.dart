import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/design/atoms/text/custom_text.dart';
import '../../../../core/ui/utils/colors/colors_ui.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  final String value;

  const ItemDetails({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: title,
          fontSize: 25,
          color: colorsUI.neutral200,
          align: TextAlign.center,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(width: 2.sp),
        Expanded(
          child: CustomText(
            title: value,
            fontSize: 25,
            color: colorsUI.neutral300,
            align: TextAlign.start,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
