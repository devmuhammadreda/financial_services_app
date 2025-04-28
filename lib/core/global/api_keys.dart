// ignore_for_file: deprecated_member_use

import 'dart:developer';

const String dummyImage = "https://picsum.photos/800";

class APIKeys {
  static String baseUrl = "https://gutendex.com/";
  static String getBooks = "books/";
  static String bravoBaseUrl = "https://api.brevo.com/v3/";
  static String sendEmail = "smtp/email";
}

String imagePath(String path) {
  log(APIKeys.baseUrl + path);
  return APIKeys.baseUrl + path;
}
