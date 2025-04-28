import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/extensions/navigatable.dart';
import 'package:financial_services_app/core/theme/text_styles.dart';
import 'package:financial_services_app/core/widgets/app_spacer.dart';
import 'package:financial_services_app/core/widgets/progress_button.dart';
import 'package:financial_services_app/features/products/presentation/pages/home_screen.dart';
import 'package:financial_services_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../contact_us/presentation/pages/contact_us_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate.appName,
          style: TextStyles.semiBold14.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        child: Column(
          children: [
            AppSpacer(),
            Center(
              child: Assets.images.companyLogo.svg(
                width: 200.sp,
                height: 200.sp,
                fit: BoxFit.cover,
              ),
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                context.push(const ContactUsScreen());
              },
              text: "Contact Us",
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                context.push(ProductsScreen());
              },
              text: "Products",
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {},
              text: "Submit complaint",
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {},
              text: "About",
            ),
          ],
        ),
      ),
    );
  }
}
