import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/ui/utils/paths/animations/animations_ui.dart';

class AnimationCard extends StatefulWidget {
  final bool web;
  final bool mobile;
  final bool tablet;
  final String animation;

  const AnimationCard({
    super.key,
    required this.animation,
    required this.mobile,
    required this.web,
    required this.tablet,
  });

  @override
  State<AnimationCard> createState() => _CustomButton();
}

class _CustomButton extends State<AnimationCard> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.animation,
      height: widget.mobile
          ? 200.sp
          : widget.tablet
          ? 200.sp
          : 120.sp,
      animate: true,
    );
  }
}
