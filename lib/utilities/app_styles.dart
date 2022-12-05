import 'package:flutter/material.dart';

Color primary = const Color(0x863A6F);

class Styles {
  static Color primaryColor = primary;
  static Color primaryAccent = Colors.deepPurpleAccent;
  static Color textColor = const Color(0xFF3B3B3B);
  static Color bgColor = Colors.white;
  static Color successColor = Color.fromARGB(255, 67, 160, 72);
  static Color warningColor = Color.fromARGB(249, 237, 108, 2);
  static Color errorColor = Color.fromARGB(255, 211, 47, 47);
  static Color grey = Color.fromARGB(255, 90, 87, 87);
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
