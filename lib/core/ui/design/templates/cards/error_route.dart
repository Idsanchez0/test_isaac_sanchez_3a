import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/animations/animations_ui.dart';

import '../../../../../features/init/presentation/widgets/animation_card.dart';
import '../../../../services/preferences/responsive_helper.dart';
import '../../../utils/colors/colors_ui.dart';
import '../../molecules/buttons/custom_button.dart';

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimationCard(
            animation: animationsUI.error,
            mobile: ResponsiveHelper.isMobile(context),
            web: ResponsiveHelper.isDesktop(context),
            tablet: ResponsiveHelper.isTablet(context),
          ),
          GestureDetector(
            onTap: () => context.go('/planets'),
            child: CustomButton(
              color: colorsUI.primary500,
              colorText: colorsUI.white,
              width: 100.sp,
              text: 'back'.tr(),
              radius: 8,
              sizeText: 8.sp,
              border: colorsUI.primary500,
            ),
          ),
        ],
      ),
    );
  }
}
