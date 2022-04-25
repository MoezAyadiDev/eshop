import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('fr'),
    const Locale('ar'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return '🇹🇳';
      case 'en':
        return 'GB';
      case 'fr':
        return 'FR';
      default:
        return 'US';
    }
  }

  static final allLang = ['en', 'fr', 'ar'];
}
