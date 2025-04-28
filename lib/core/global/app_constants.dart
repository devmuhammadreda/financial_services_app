const int pageLimit = 10;

class AppConstants {
  static const String ar = 'ar';
  static const String en = 'en';
  static const String dateFormate = 'yyyy-MM-dd';
  static const String timeFormate = 'HH:mm';
  static const String dateOfBirthFormate = 'yyyy-MM-dd HH:mm';
  static const String appPhoneKey = '+20';
  static const String appCountryKey = 'EG';
}

class ContactInfo {
  static const String phone = '+201021174068';
  static const String email = 'devmuhammadreda@gmail.com';
}

String emailMsg = """
<div style="font-family: Arial, sans-serif; color: #333333;">
  <h2 style="color: #4a86e8;">Thank You for Contacting Us</h2>
  <p>We appreciate you reaching out to our team.</p>
  <p>We have received your message and will get back to you as soon as possible to help resolve your issue.</p>
  <p>In the meantime, please feel free to check our <a href="#" style="color: #4a86e8; text-decoration: none;">FAQ section</a> for quick answers to common questions.</p>
  <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #eeeeee;">
    <p style="font-size: 14px;">Best regards,</p>
    <p style="font-size: 14px; font-weight: bold;">Customer Support Team</p>
  </div>
</div>
""";
