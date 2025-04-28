import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/global/enums.dart';
import 'package:financial_services_app/core/theme/text_styles.dart';
import 'package:financial_services_app/core/widgets/progress_button.dart';
import 'package:financial_services_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/strings.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/app_spacer.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/generic_dropdown_button.dart';
import '../cubit/submit_complaint_cubit.dart';

class SubmitComplaintScreen extends StatelessWidget {
  const SubmitComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubmitComplaintCubit>(
      create: (context) => sl<SubmitComplaintCubit>(),
      child: BlocConsumer<SubmitComplaintCubit, SubmitComplaintState>(
        listener: (context, state) {},
        builder: (context, state) {
          SubmitComplaintCubit cubit = context.read<SubmitComplaintCubit>();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                context.translate.submit_complaint,
                style: TextStyles.semiBold14.copyWith(color: Colors.black),
              ),
            ),
            body: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
                child: Column(
                  children: [
                    CustomTextField(
                      hint: context.translate.your_name,
                      name: context.translate.your_name,
                      type: TextInputType.name,
                      autoFillHints: const [AutofillHints.name],
                      validate: Validator.validateName,
                      controller: cubit.nameController,
                    ),
                    AppSpacer(),
                    CustomTextField(
                      hint: context.translate.your_phone,
                      name: context.translate.your_phone,
                      type: TextInputType.phone,
                      controller: cubit.phoneController,
                      autoFillHints: const [AutofillHints.telephoneNumber],
                      validate: Validator.validatePhone,
                      formattedType: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                    ),
                    AppSpacer(),
                    GenericDropdownButton<ComplaintType>(
                      items: ComplaintType.values.map((e) => e).toList(),
                      itemLabel: (item) => getComplaintTypeString(item),
                      selectedItem: cubit.complaintType,
                      onChanged: (item) {
                        cubit.setComplaintType(item!);
                      },
                      validator: (item) {
                        if (item == null) {
                          return context.translate.val_empty;
                        }
                        return null;
                      },
                      name: context.translate.complaint_type,
                      hint: context.translate.complaint_type_placeholder,
                    ),
                    AppSpacer(),
                    CustomTextField(
                      hint: context.translate.complaint_description_placeholder,
                      name: context.translate.complaint_description,
                      type: TextInputType.multiline,
                      maxLines: 5,
                      autoFillHints: const [AutofillHints.addressCity],
                      validate: Validator.validateEmptyField,
                      controller: cubit.complaintDescriptionController,
                    ),
                    AppSpacer(),
                    AppProgressButton(
                      onPressed: (anim) {
                        cubit.submitComplaint();
                      },
                      text: context.translate.submit,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
