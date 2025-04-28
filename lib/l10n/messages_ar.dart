// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'messages.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'تطبيق الخدمات المالية';

  @override
  String get an_error_occurred => 'حدث خطأ أثناء تحميل التطبيق';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get no_books_found => 'لا توجد كتب متاحة';

  @override
  String get search => 'بحث';

  @override
  String get search_books => 'ابحث عن كتب';

  @override
  String get see_more => 'عرض المزيد';

  @override
  String get see_less => 'عرض أقل';

  @override
  String get val_username => 'لا يمكن أن يكون الاسم فارغًا';

  @override
  String get val_phone_empty => 'لا يمكن أن يكون رقم الهاتف فارغًا';

  @override
  String get val_phone_invalid => 'رقم الهاتف غير صالح';

  @override
  String get val_empty => 'لا يمكن أن يكون هذا الحقل فارغًا';

  @override
  String get val_email_empty => 'لا يمكن أن يكون البريد الإلكتروني فارغًا';

  @override
  String get val_email_invalid => 'البريد الإلكتروني غير صالح';

  @override
  String get contact_us_email_message => 'نشكرك على الاتصال بنا وسنتصل بك قريبًا لحل مشكلتك';

  @override
  String get contact_us_success_message => 'تم إرسال رسالتك بنجاح';

  @override
  String get contact_us_error_message => 'حدث خطأ أثناء إرسال رسالتك';
}
