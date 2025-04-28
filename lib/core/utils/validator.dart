import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/utils/router.dart';

class Validator {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return MagicRouter.currentContext!.translate.val_username;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    final regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (value == null || value.trim().isEmpty) {
      return MagicRouter.currentContext!.translate.val_phone_empty;
    } else if (!regex.hasMatch(value)) {
      return MagicRouter.currentContext!.translate.val_phone_invalid;
    }
    return null;
  }

  static String? validateEmptyField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return MagicRouter.currentContext!.translate.val_empty;
    }
    return null;
  }
  static String? validateEmail(String? value) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.trim().isEmpty) {
      return MagicRouter.currentContext!.translate.val_email_empty;
    } else if (!regex.hasMatch(value)) {
      return MagicRouter.currentContext!.translate.val_email_invalid;
    }
    return null;
  }
}
