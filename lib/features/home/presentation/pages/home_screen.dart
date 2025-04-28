import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/extensions/navigatable.dart';
import 'package:financial_services_app/core/localizations_cubit/localizations_cubit.dart';
import 'package:financial_services_app/core/theme/text_styles.dart';
import 'package:financial_services_app/core/widgets/app_spacer.dart';
import 'package:financial_services_app/core/widgets/progress_button.dart';
import 'package:financial_services_app/features/products/presentation/pages/home_screen.dart';
import 'package:financial_services_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/services/restart_app.dart';
import '../../../about_company/presentation/pages/about_us_company_screen.dart';
import '../../../contact_us/presentation/pages/contact_us_screen.dart';
import '../../../submit_complaint/presentation/pages/submit_complaint_screen.dart';

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
        actions: [
          BlocConsumer<LocalizationsCubit, LocalizationsState>(
            listener: (context, state) {
              if (state is ChangeAppLocalizationsState) {
                RestartWidget.restartApp(context);
              }
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  final cubit = context.read<LocalizationsCubit>();
                  final newLocale = cubit.locale.languageCode == 'en'
                      ? const Locale('ar', 'EG')
                      : const Locale('en', 'US');
                  cubit.setLocale(newLocale);
                },
                icon: Icon(Iconsax.global_copy),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        child: Column(
          children: [
            AppSpacer(),
            Center(
              child: Hero(
                tag: 'company_logo',
                child: Assets.images.companyLogo.svg(
                  width: 200.sp,
                  height: 200.sp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                context.push(const ContactUsScreen());
              },
              text: context.translate.contact_us,
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                context.push(ProductsScreen());
              },
              text: context.translate.products,
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                context.push(const SubmitComplaintScreen());
              },
              text: context.translate.submit_complaint,
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                context
                    .push(const AboutUsCompanyScreen(heroTag: 'company_logo'));
              },
              text: context.translate.about_us,
            ),
          ],
        ),
      ),
    );
  }
}
