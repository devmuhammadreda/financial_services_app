import 'package:dartz/dartz.dart';
import 'package:financial_services_app/core/error/failures.dart';
import 'package:financial_services_app/features/contact_us/domain/entities/brevo_email_entity.dart';
import 'package:financial_services_app/features/contact_us/domain/params/send_email_params.dart';
import 'package:financial_services_app/features/contact_us/domain/repositories/contact_us_base_repo.dart';

import '../datasources/contact_us_remote_datasource.dart';

class ContactUsRepo extends ContactUsBaseRepo {
  ContactUsRemoteBaseDataSource contactUsRemoteBaseDataSource;
  ContactUsRepo(this.contactUsRemoteBaseDataSource);
  @override
  Future<Either<Failure, BrevoEmailEntity>> sendEmail(
      SendEmailParams params) async {
    try {
      final result =
          await contactUsRemoteBaseDataSource.sendContactUsForm(params);
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
