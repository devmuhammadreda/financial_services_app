import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/brevo_email_entity.dart';
import '../params/send_email_params.dart';

abstract class ContactUsBaseRepo{
  Future<Either<Failure, BrevoEmailEntity>> sendEmail(SendEmailParams params);
}
