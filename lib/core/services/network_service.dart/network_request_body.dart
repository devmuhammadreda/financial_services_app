import 'dart:convert';
import 'package:dio/dio.dart';

sealed class NetworkRequestBody {
  const NetworkRequestBody();

  factory NetworkRequestBody.empty() = EmptyNetworkRequestBody;
  factory NetworkRequestBody.fromData(FormData data) =
      FormDataNetworkRequestBody;
  factory NetworkRequestBody.text(String data) = TextNetworkRequestBody;
  factory NetworkRequestBody.raw(Map<String, dynamic> data) =
      RawNetworkRequestBody;
  factory NetworkRequestBody.json(Map<String, dynamic> data) =
      JsonNetworkRequestBody;
}

class EmptyNetworkRequestBody extends NetworkRequestBody {
  const EmptyNetworkRequestBody();
}

class FormDataNetworkRequestBody extends NetworkRequestBody {
  final FormData data;
  const FormDataNetworkRequestBody(this.data);
}

class TextNetworkRequestBody extends NetworkRequestBody {
  final String data;
  const TextNetworkRequestBody(this.data);
}

class RawNetworkRequestBody extends NetworkRequestBody {
  final Map<String, dynamic> data;
  const RawNetworkRequestBody(this.data);
}

class JsonNetworkRequestBody extends NetworkRequestBody {
  final Map<String, dynamic> data;
  const JsonNetworkRequestBody(this.data);

  String toJsonString() {
    return jsonEncode(data);
  }
}
