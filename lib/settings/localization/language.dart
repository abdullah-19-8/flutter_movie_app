import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  kurdish(
    Locale('fa', 'IR'),
    'كوردى',
  ),
  arabic(
    Locale('ar', 'SA'),
    'العربية',
  );

  const Language(this.value, this.text);

  final Locale value;
  final String text;
}
