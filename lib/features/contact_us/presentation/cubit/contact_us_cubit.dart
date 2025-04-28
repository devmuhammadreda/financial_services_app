import 'package:dartz/dartz.dart';
import 'package:financial_services_app/core/global/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/brevo_email_entity.dart';
import '../../domain/params/send_email_params.dart';
import '../../domain/usecases/send_email_usecase.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit({
    required this.sendEmailUsecase,
  }) : super(ContactUsInitial());
  SendEmailUsecase sendEmailUsecase;
  GlobalKey<FormState> contactUsFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> sendEmail() async {
    if (!contactUsFormKey.currentState!.validate()) {
      return;
    }
    SendEmailParams sendEmailParams = SendEmailParams(
      fromEmail: "devmuhammadreda@gmail.com",
      fromName: "Muhammad Reda",
      toEmail: emailController.text,
      toName: nameController.text,
      subject: "Contact Us",
      htmlContent: emailMsg,
    );
    Either<Failure, BrevoEmailEntity> res =
        await sendEmailUsecase.call(sendEmailParams);
    res.fold(
      (l) {
        emit(ContactUsFailure(error: l.message));
      },
      (r) {
        emit(ContactUsSuccess());
      },
    );
  }
}
