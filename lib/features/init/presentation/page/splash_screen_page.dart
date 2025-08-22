import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_isaac_sanchez/core/services/preferences/responsive_helper.dart';
import 'package:test_isaac_sanchez/core/ui/design/atoms/text/custom_text.dart';
import 'package:test_isaac_sanchez/core/ui/design/molecules/buttons/custom_button.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/animations/animations_ui.dart';
import 'package:test_isaac_sanchez/features/init/presentation/widgets/animation_card.dart';

import '../../../../core/ui/utils/colors/colors_ui.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: colorsUI.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                title: 'welcome'.tr(),
                fontSize: 20.sp,
                color: colorsUI.primary800,
                align: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5.sp),
              AnimationCard(
                animation: animationsUI.welcome,
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
                  text: 'see-planet'.tr(),
                  radius: 8,
                  sizeText: 8.sp,
                  border: colorsUI.primary500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
