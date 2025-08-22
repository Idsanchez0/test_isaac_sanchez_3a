import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/colors_ui.dart';

class MiddleModal {
  /// Muestra un modal centrado con un builder dinámico para reconstrucción segura.
  void middleModal(
    BuildContext context,
    Widget Function(BuildContext context) builder,
    Color? color,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: colorsUI.black.withAlpha(80),
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Material(
                type: MaterialType.transparency,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 5.sp),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.sp),
                    decoration: BoxDecoration(
                      color: color ?? colorsUI.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: builder(context), // contenido dinámico
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

MiddleModal middleModals = MiddleModal();
