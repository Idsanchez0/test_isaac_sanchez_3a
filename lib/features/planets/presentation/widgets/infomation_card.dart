import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac_sanchez/features/planets/domain/planets_model.dart';

import '../../../../core/ui/design/atoms/text/custom_text.dart';
import '../../../../core/ui/design/templates/cards/transparent_card.dart';
import '../../../../core/ui/utils/colors/colors_ui.dart';
import 'item_details.dart';

class InformationCard extends StatelessWidget {
  final PlanetsModel data;

  const InformationCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return TransparentCard(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 3.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: data.name.toString(),
              fontSize: 40,
              color: colorsUI.white,
              align: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 3.sp),
            ItemDetails(
              title: 'Orbital Distance (Km): ',
              value: '${data.orbitalDistanceKm ?? ''} Km',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Equatorial Radius: ',
              value: '${data.equatorialRadiusKm ?? ''} Km',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Volume: ',
              value: '${data.volumeKm3 ?? ''} Km³',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(title: 'Mass: ', value: '${data.massKg ?? ''} Kg'),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Density: ',
              value: '${data.densityGCm3 ?? ''} g/cm³',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Surface Gravity: ',
              value: '${data.surfaceGravityMS2 ?? ''} m/s²',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Escape Velocity: ',
              value: '${data.escapeVelocityKmh ?? ''} Km/h',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Day Length Earth Days: ',
              value: data.dayLengthEarthDays ?? '',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Year Length Earth Days: ',
              value: data.yearLengthEarthDays ?? '',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Orbital Speed: ',
              value: '${data.orbitalSpeedKmh ?? ''} Km/h',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(
              title: 'Atmosphere Composition: ',
              value: data.atmosphereComposition ?? '',
            ),
            SizedBox(height: 2.sp),
            ItemDetails(title: 'Moons: ', value: data.moons ?? ''),
            SizedBox(height: 2.sp),
            ItemDetails(title: 'Description: ', value: data.description ?? ''),
          ],
        ),
      ),
    );
  }
}
