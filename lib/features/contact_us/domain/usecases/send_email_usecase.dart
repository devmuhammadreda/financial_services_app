import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entities/brevo_email_entity.dart';
import '../params/send_email_params.dart';
import '../repositories/contact_us_base_repo.dart';

class SendEmailUsecase
    extends BaseUseCase<BrevoEmailEntity, SendEmailParams> {
  final ContactUsBaseRepo contactUsBaseRepo;

  SendEmailUsecase({required this.contactUsBaseRepo});

  @override
  Future<Either<Failure, BrevoEmailEntity>> call(
      SendEmailParams parameters) async {
    return await contactUsBaseRepo.sendEmail(parameters);
  }
}
