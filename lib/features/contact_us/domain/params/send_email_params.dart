// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class SendEmailParams {
  final String toEmail;
  final String toName;
  final String subject;
  final String? htmlContent;
  final String? textContent;
  final String fromEmail;
  final String fromName;
  final List<Map<String, dynamic>>? attachments;
  SendEmailParams({
    required this.toEmail,
    required this.toName,
    required this.subject,
    this.htmlContent,
    this.textContent,
    required this.fromEmail,
    required this.fromName,
    this.attachments,
  });

  SendEmailParams copyWith({
    String? toEmail,
    String? toName,
    String? subject,
    String? htmlContent,
    String? textContent,
    String? fromEmail,
    String? fromName,
    List<Map<String, dynamic>>? attachments,
  }) {
    return SendEmailParams(
      toEmail: toEmail ?? this.toEmail,
      toName: toName ?? this.toName,
      subject: subject ?? this.subject,
      htmlContent: htmlContent ?? this.htmlContent,
      textContent: textContent ?? this.textContent,
      fromEmail: fromEmail ?? this.fromEmail,
      fromName: fromName ?? this.fromName,
      attachments: attachments ?? this.attachments,
    );
  }

  Map<String, dynamic> toPayload() {
    final Map<String, dynamic> payload = {
      'sender': {
        'name': fromName,
        'email': fromEmail,
      },
      'to': [
        {
          'email': toEmail,
          'name': toName,
        }
      ],
      'subject': subject,
      if (htmlContent != null) 'htmlContent': htmlContent,
      if (textContent != null) 'textContent': textContent,
      if (attachments != null && attachments!.isNotEmpty)
        'attachment': attachments,
    };

    return payload;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'toEmail': toEmail,
      'toName': toName,
      'subject': subject,
      'htmlContent': htmlContent,
      'textContent': textContent,
      'fromEmail': fromEmail,
      'fromName': fromName,
      'attachments': attachments,
    };
  }

  @override
  String toString() {
    return 'SendEmailParams(toEmail: $toEmail, toName: $toName, subject: $subject, htmlContent: $htmlContent, textContent: $textContent, fromEmail: $fromEmail, fromName: $fromName, attachments: $attachments)';
  }

  @override
  bool operator ==(covariant SendEmailParams other) {
    if (identical(this, other)) return true;

    return other.toEmail == toEmail &&
        other.toName == toName &&
        other.subject == subject &&
        other.htmlContent == htmlContent &&
        other.textContent == textContent &&
        other.fromEmail == fromEmail &&
        other.fromName == fromName &&
        listEquals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return toEmail.hashCode ^
        toName.hashCode ^
        subject.hashCode ^
        htmlContent.hashCode ^
        textContent.hashCode ^
        fromEmail.hashCode ^
        fromName.hashCode ^
        attachments.hashCode;
  }
}
