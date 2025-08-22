import 'package:flutter/material.dart';

import '../../../../core/services/preferences/responsive_helper.dart';

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveHelper.isDesktop(context) ? 400 : 300,
      height: ResponsiveHelper.isDesktop(context) ? 400 : 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        image: DecorationImage(image: NetworkImage(image)),
      ),
    );
  }
}
