import 'package:flutter/material.dart';

import '../../../utils/colors/colors_ui.dart';

class TransparentCard extends StatelessWidget {
  final Widget child;

  const TransparentCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorsUI.black.withAlpha(150),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: colorsUI.neutral300),
      ),
      child: child,
    );
  }
}
