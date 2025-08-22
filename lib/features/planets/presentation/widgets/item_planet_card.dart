import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac_sanchez/features/planets/domain/planets_model.dart';

import '../../../../core/services/preferences/responsive_helper.dart';
import '../../../../core/ui/design/atoms/text/custom_text.dart';
import '../../../../core/ui/design/molecules/buttons/custom_button.dart';
import '../../../../core/ui/utils/colors/colors_ui.dart';

class ItemPlanetCard extends StatelessWidget {
  final PlanetsModel data;

  const ItemPlanetCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 3.sp),
        ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(70), // Image radius
            child: Image.network(data.image.toString(), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 5.sp),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: 5.sp,
              bottom: ResponsiveHelper.isDesktop(context) ? 3.sp : 8.sp,
              top: ResponsiveHelper.isDesktop(context) ? 3.sp : 8.sp,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: data.name.toString(),
                  fontSize: 18,
                  color: colorsUI.white,
                  align: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  title: data.description.toString(),
                  fontSize: 12,
                  color: colorsUI.white,
                  align: TextAlign.start,
                  fontWeight: FontWeight.normal,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    color: colorsUI.primary500,
                    colorText: colorsUI.white,
                    text: 'see-detail'.tr(),
                    width: ResponsiveHelper.isDesktop(context) ? 60.sp : 120.sp,
                    radius: 50,
                    border: colorsUI.primary500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
