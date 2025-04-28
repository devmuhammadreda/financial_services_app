extension EgyptianPhoneFormatter on String {
  /// Format phone number like: +20 10 2117 4068
  String get nicelyFormattedEgyptianPhone {
    // Remove all non-digits
    final digits = replaceAll(RegExp(r'\D'), '');

    if (digits.length == 11 && digits.startsWith('0')) {
      // Local format like 01021174068 -> make +20 10 2117 4068
      final operator = digits.substring(1, 3);
      final part1 = digits.substring(3, 7);
      final part2 = digits.substring(7);
      return '+20 $operator $part1 $part2';
    }

    if (digits.length == 12 && digits.startsWith('20')) {
      // Already with 20 prefix like 201021174068
      final operator = digits.substring(2, 4);
      final part1 = digits.substring(4, 8);
      final part2 = digits.substring(8);
      return '+20 $operator $part1 $part2';
    }

    if (digits.length == 13 && digits.startsWith('20')) {
      // Maybe entered with extra leading zero wrongly?
      final operator = digits.substring(3, 5);
      final part1 = digits.substring(5, 9);
      final part2 = digits.substring(9);
      return '+20 $operator $part1 $part2';
    }

    return this; // If format is unknown, return original
  }

  /// Validate if it's a correct Egyptian mobile phone
  bool get isValidEgyptianPhone {
    final digits = replaceAll(RegExp(r'\D'), '');
    return (digits.length == 11 &&
            RegExp(r'^01[0125][0-9]{8}$').hasMatch(digits)) ||
        (digits.length == 12 && digits.startsWith('20')) ||
        (digits.length == 13 && digits.startsWith('20'));
  }
}
