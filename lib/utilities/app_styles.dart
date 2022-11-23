import 'package:flutter/material.dart';

Color primary = const Color(0x863A6F);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3B3B3B);
  static Color bgColor = const Color(0xEFF5F5);
  static Color successColor = const Color(0x43a047);
  static Color warningColor = const Color(0xEFF5F5);
  static Color errorColor = const Color(0xEFF5F5);
  static TextStyle textStyle =
      TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle headingStyle =
      TextStyle(color: textColor, fontSize: 26, fontWeight: FontWeight.bold);
  static TextStyle subHeadingStyle =
      TextStyle(color: textColor, fontSize: 21, fontWeight: FontWeight.bold);
  static TextStyle captionStyle =
      TextStyle(color: textColor, fontSize: 21, fontWeight: FontWeight.w500);
  static TextStyle paragraftStryle = TextStyle(
      color: Colors.grey[500], fontSize: 14, fontWeight: FontWeight.w500);
}
