// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'messages.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Financial Services App';

  @override
  String get an_error_occurred => 'An error occurred while loading the app';

  @override
  String get retry => 'Retry';

  @override
  String get no_books_found => 'No books available';

  @override
  String get search => 'Search';

  @override
  String get search_books => 'Search for books';

  @override
  String get see_more => 'See more';

  @override
  String get see_less => 'See less';

  @override
  String get val_username => 'name cannot be empty';

  @override
  String get val_phone_empty => 'phone number cannot be empty';

  @override
  String get val_phone_invalid => 'phone number is invalid';

  @override
  String get val_empty => 'this field cannot be empty';

  @override
  String get val_email_empty => 'email cannot be empty';

  @override
  String get val_email_invalid => 'email is invalid';

  @override
  String get contact_us_email_message => 'thank you for contacting us we will get back to you soon to solve your issue';

  @override
  String get contact_us_success_message => 'your message has been sent successfully';

  @override
  String get contact_us_error_message => 'an error occurred while sending your message';
}
