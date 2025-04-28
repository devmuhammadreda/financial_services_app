// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/widgets/app_spacer.dart';
import 'package:financial_services_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/main_map_widget.dart';

class AboutUsCompanyScreen extends StatelessWidget {
  const AboutUsCompanyScreen({
    super.key,
    required this.heroTag,
  });
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate.about_us,
          style: TextStyles.semiBold14.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: heroTag,
                child: Assets.images.companyLogo.svg(
                  width: 400.sp,
                  height: 300.sp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              context.translate.company_overview,
              style: TextStyles.bold16.copyWith(
                color: Colors.black,
                height: 1.5,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              context.translate.company_overview_description,
              style: TextStyles.regular14.copyWith(
                color: Colors.black,
                height: 1.5,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              context.translate.company_overview_mission,
              style: TextStyles.bold16.copyWith(
                color: Colors.black,
                height: 1.5,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              context.translate.company_mission_description,
              style: TextStyles.regular14.copyWith(
                color: Colors.black,
                height: 1.5,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.translate.company_overview_vision,
                        style: TextStyles.bold16.copyWith(
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                      AppSpacer(heightRatio: .5),
                      Text(
                        context.translate.company_vision_description,
                        style: TextStyles.regular14.copyWith(
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacer(widthRatio: .5),
                SizedBox(
                  width: context.screenWidth / 2.3,
                  height: 120.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: MainMapWidget(
                      location: LatLng(30.06438474159143, 31.22782748270916),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
