import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'messages_ar.dart';
import 'messages_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/messages.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Financial Services App'**
  String get appName;

  /// No description provided for @an_error_occurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading the app'**
  String get an_error_occurred;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @no_books_found.
  ///
  /// In en, this message translates to:
  /// **'No books available'**
  String get no_books_found;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @search_books.
  ///
  /// In en, this message translates to:
  /// **'Search for books'**
  String get search_books;

  /// No description provided for @see_more.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get see_more;

  /// No description provided for @see_less.
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get see_less;

  /// No description provided for @val_username.
  ///
  /// In en, this message translates to:
  /// **'name cannot be empty'**
  String get val_username;

  /// No description provided for @val_phone_empty.
  ///
  /// In en, this message translates to:
  /// **'phone number cannot be empty'**
  String get val_phone_empty;

  /// No description provided for @val_phone_invalid.
  ///
  /// In en, this message translates to:
  /// **'phone number is invalid'**
  String get val_phone_invalid;

  /// No description provided for @val_empty.
  ///
  /// In en, this message translates to:
  /// **'this field cannot be empty'**
  String get val_empty;

  /// No description provided for @val_email_empty.
  ///
  /// In en, this message translates to:
  /// **'email cannot be empty'**
  String get val_email_empty;

  /// No description provided for @val_email_invalid.
  ///
  /// In en, this message translates to:
  /// **'email is invalid'**
  String get val_email_invalid;

  /// No description provided for @contact_us_email_message.
  ///
  /// In en, this message translates to:
  /// **'thank you for contacting us we will get back to you soon to solve your issue'**
  String get contact_us_email_message;

  /// No description provided for @contact_us_success_message.
  ///
  /// In en, this message translates to:
  /// **'your message has been sent successfully'**
  String get contact_us_success_message;

  /// No description provided for @contact_us_error_message.
  ///
  /// In en, this message translates to:
  /// **'an error occurred while sending your message'**
  String get contact_us_error_message;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'more'**
  String get more;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @your_message.
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get your_message;

  /// No description provided for @your_name.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get your_name;

  /// No description provided for @your_email.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get your_email;

  /// No description provided for @your_phone.
  ///
  /// In en, this message translates to:
  /// **'Your Phone'**
  String get your_phone;

  /// No description provided for @your_message_placeholder.
  ///
  /// In en, this message translates to:
  /// **'write your message here'**
  String get your_message_placeholder;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @submit_complaint.
  ///
  /// In en, this message translates to:
  /// **'Submit Complaint'**
  String get submit_complaint;

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get about_us;

  /// No description provided for @complaint_type.
  ///
  /// In en, this message translates to:
  /// **'Complaint Type'**
  String get complaint_type;

  /// No description provided for @complaint_type_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select complaint type'**
  String get complaint_type_placeholder;

  /// No description provided for @complaint_description.
  ///
  /// In en, this message translates to:
  /// **'Complaint Description'**
  String get complaint_description;

  /// No description provided for @complaint_description_placeholder.
  ///
  /// In en, this message translates to:
  /// **'write complaint description here'**
  String get complaint_description_placeholder;

  /// No description provided for @complaint_success_message.
  ///
  /// In en, this message translates to:
  /// **'Your complaint has been submitted successfully'**
  String get complaint_success_message;

  /// No description provided for @complaint_error_message.
  ///
  /// In en, this message translates to:
  /// **'an error occurred while submitting your complaint'**
  String get complaint_error_message;

  /// No description provided for @sroducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get sroducts;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @wait_time.
  ///
  /// In en, this message translates to:
  /// **'Wait Time'**
  String get wait_time;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @personnel.
  ///
  /// In en, this message translates to:
  /// **'Personnel'**
  String get personnel;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @company_overview.
  ///
  /// In en, this message translates to:
  /// **'Company Overview'**
  String get company_overview;

  /// No description provided for @company_overview_description.
  ///
  /// In en, this message translates to:
  /// **'We are a leading company in providing financial and banking services. We are committed to providing the best financial solutions to our customers.'**
  String get company_overview_description;

  /// No description provided for @company_overview_mission.
  ///
  /// In en, this message translates to:
  /// **'Mission'**
  String get company_overview_mission;

  /// No description provided for @company_overview_vision.
  ///
  /// In en, this message translates to:
  /// **'Vision'**
  String get company_overview_vision;

  /// No description provided for @company_mission_description.
  ///
  /// In en, this message translates to:
  /// **'To provide innovative and reliable financial services that meet our customers\' needs.'**
  String get company_mission_description;

  /// No description provided for @company_vision_description.
  ///
  /// In en, this message translates to:
  /// **'To be the first choice for customers in providing financial solutions.'**
  String get company_vision_description;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return SAr();
    case 'en': return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
