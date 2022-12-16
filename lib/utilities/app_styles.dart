import 'package:flutter/material.dart';

Color primary = const Color(0x863A6F);

class Styles {
  static Color primaryColor = primary;
  static Color primaryAccent = Colors.deepPurpleAccent;
  static Color textColor = const Color(0xFF3B3B3B);
  static Color bgColor = Colors.white;
  static Color successColor = Color(0x43A048);
  static Color warningColor = Color(0xED6C02);
  static Color errorColor = Color(0xD32F2F);
  static Color grey = Color(0x5A5757);
  static TextStyle headingStyle = TextStyle(
    color: textColor,
    fontSize: 26,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );
  static TextStyle subHeadingStyle = TextStyle(
    color: Colors.black54,
    fontSize: 21,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );
  static TextStyle subHeadingStyle2 = TextStyle(
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );
  static TextStyle captionStyle = TextStyle(
    color: Colors.black87,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );
  static TextStyle paragraftStyle = TextStyle(
    color: Colors.grey[500],
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );
  static TextStyle textStyle = TextStyle(
    color: Colors.black54,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );
}
