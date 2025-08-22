import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac_sanchez/core/services/preferences/responsive_helper.dart';

import '../../../utils/colors/colors_ui.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final dynamic inputType;
  final bool enable;
  final dynamic hintText;
  final bool isFocused;
  final Function? onChangeData;
  final String? type;
  final IconData? iconSuffix;
  final double? radius;
  final double height;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.enable,
    required this.hintText,
    this.type,
    required this.isFocused,
    this.iconSuffix,
    this.onChangeData,
    this.radius,
    required this.height,
  });

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: ResponsiveHelper.isDesktop(context) ? 2.sp : 5.sp,
          horizontal: ResponsiveHelper.isDesktop(context) ? 5.sp : 10.sp,
        ),
        hintStyle: TextStyle(
          color: colorsUI.neutral300,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        hintText: widget.hintText,
        fillColor: Colors.white,
        suffixIcon: widget.iconSuffix != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Icon(widget.iconSuffix!, size: 20),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorsUI.primary700, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorsUI.neutral300, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isFocused ? Colors.blue : colorsUI.neutral300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      keyboardType: widget.inputType,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.black,
      enabled: widget.enable,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorsUI.primary800,
      ),
      onChanged: (x) {
        widget.onChangeData!(x);
      },
    );
  }
}
