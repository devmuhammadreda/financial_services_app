import 'package:bot_toast/bot_toast.dart';
import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/extensions/string.dart';
import 'package:financial_services_app/core/extensions/widget.dart';
import 'package:financial_services_app/core/global/app_constants.dart';
import 'package:financial_services_app/core/theme/colors_manager.dart';
import 'package:financial_services_app/core/theme/text_styles.dart';
import 'package:financial_services_app/core/utils/router.dart';
import 'package:financial_services_app/core/widgets/app_spacer.dart';
import 'package:financial_services_app/core/widgets/custom_text_field.dart';
import 'package:financial_services_app/core/widgets/progress_button.dart';
import 'package:financial_services_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../cubit/contact_us_cubit.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactUsCubit>(
      create: (context) => sl<ContactUsCubit>(),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state) {
        if (state is ContactUsLoading) {
          showLoading();
        }
        if (state is ContactUsSuccess) {
          hideLoading();
          MagicRouter.pop();
          BotToast.showText(text: context.translate.contact_us_success_message);
        }
        if (state is ContactUsFailure) {
          hideLoading();
          BotToast.showText(text: context.translate.contact_us_error_message);
        }
      }, builder: (context, state) {
        ContactUsCubit cubit = context.read<ContactUsCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              context.translate.contact_us,
              style: TextStyles.semiBold14.copyWith(color: Colors.black),
            ),
          ),
          body: Form(
            key: cubit.contactUsFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  contactInfo(
                    value: ContactInfo.phone.nicelyFormattedEgyptianPhone,
                    icon: Icons.phone,
                  ),
                  contactInfo(
                    value: ContactInfo.email,
                    icon: Icons.email,
                  ),
                  AppSpacer(),
                  CustomTextField(
                    hint: context.translate.your_name,
                    type: TextInputType.name,
                    autoFillHints: const [AutofillHints.name],
                    validate: Validator.validateName,
                    controller: cubit.nameController,
                  ),
                  AppSpacer(),
                  CustomTextField(
                    hint: context.translate.your_email,
                    type: TextInputType.emailAddress,
                    autoFillHints: const [AutofillHints.email],
                    validate: Validator.validateEmail,
                    controller: cubit.emailController,
                  ),
                  AppSpacer(),
                  CustomTextField(
                    hint: context.translate.your_phone,
                    type: TextInputType.phone,
                    autoFillHints: const [AutofillHints.telephoneNumber],
                    validate: Validator.validatePhone,
                    formattedType: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    controller: cubit.phoneController,
                  ),
                  AppSpacer(),
                  CustomTextField(
                    hint: context.translate.your_message,
                    type: TextInputType.multiline,
                    maxLines: 5,
                    validate: Validator.validateEmptyField,
                    controller: cubit.messageController,
                  ),
                  AppSpacer(heightRatio: 3),
                  AppProgressButton(
                    onPressed: (anim) {
                      cubit.sendEmail();
                    },
                    text: context.translate.send,
                  ),
                ],
              ),
            ).paddingAll(20.sp),
          ),
        );
      }),
    );
  }

  Widget contactInfo({
    required String value,
    required IconData icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20.sp,
          color: ColorsManager.subPrimary,
        ),
        AppSpacer(widthRatio: .5),
        Text(
          value,
          style: TextStyles.bold16.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 10.sp);
  }
}
