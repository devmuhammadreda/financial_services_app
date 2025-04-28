import 'package:bot_toast/bot_toast.dart';
import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/utils/router.dart';
import 'package:financial_services_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global/enums.dart';

part 'submit_complaint_state.dart';

class SubmitComplaintCubit extends Cubit<SubmitComplaintState> {
  SubmitComplaintCubit() : super(SubmitComplaintInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController complaintDescriptionController =
      TextEditingController();
  ComplaintType? complaintType;

  void setComplaintType(ComplaintType type) {
    complaintType = type;
    emit(SetComplaintTypeState());
  }

  void submitComplaint() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    showLoading();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        MagicRouter.pop();
        BotToast.showText(
            text: MagicRouter
                .currentContext!.translate.complaint_success_message);
        hideLoading();
      },
    );
  }
}
