import '../../domain/entities/brevo_email_entity.dart';

class BrevoEmailModel extends BrevoEmailEntity {
  BrevoEmailModel({
    super.messageId,
  });

  factory BrevoEmailModel.fromJson(Map<String, dynamic> json) {
    return BrevoEmailModel(
      messageId: json['messageId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
    };
  }
}
