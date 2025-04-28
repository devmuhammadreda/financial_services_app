import 'package:financial_services_app/core/services/network_service.dart/network_request_body.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/global/api_keys.dart';
import '../../../../core/services/network_service.dart/api_basehelper.dart';
import '../../domain/entities/brevo_email_entity.dart';
import '../../domain/params/send_email_params.dart';
import '../models/brevo_email_model.dart';

abstract class ContactUsRemoteBaseDataSource {
  Future<BrevoEmailEntity> sendContactUsForm(SendEmailParams params);
}

class ContactUsRemoteDataSource implements ContactUsRemoteBaseDataSource {
  ApiBaseHelper apiBaseHelper;
  ContactUsRemoteDataSource(this.apiBaseHelper);
  @override
  Future<BrevoEmailEntity> sendContactUsForm(SendEmailParams params) async {
    String? apiKey = dotenv.env['API_KEY'];
    final Map<String, String> headers = {
      'accept': 'application/json',
      if (apiKey != null) 'api-key': apiKey,
      'content-type': 'application/json',
    };

    final response = await apiBaseHelper.request(
      method: HttpMethod.post,
      url: APIKeys.sendEmail,
      customHeaders: headers,
      customBaseUrl: APIKeys.bravoBaseUrl,
      body: NetworkRequestBody.json(params.toPayload()),
    );
    try {
      return BrevoEmailModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
