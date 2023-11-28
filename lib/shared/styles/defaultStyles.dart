import 'package:flutter/material.dart';

String fontFamily = 'Roboto';
Color crblack800 = const Color(0xff0D0D0D);
Color crBlue900 = const Color(0xff5998C5);
Color crBlue700 = const Color(0xff60BFF4);

Color crBlue200 = const Color(0xffD7F9F1);
Color crYellow500 = const Color(0xffD4F11D);
Color crWhite = const Color(0xffFFFFFF);
Color crBlack = const Color(0xff000000);

/* Border and BorderRadius */

double borderRadius1 = 12;
double borderRadius2 = 6;
// String fontFamily = 'Roboto';

/* ============================================== */

TextStyle titleStyle = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: fontFamily,
);

/* TextStyle linkStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  fontFamily: fontFamily,
);
 */
TextStyle hintStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: fontFamily,
);

/* var textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius1),
); */

/* COLORS */

/* Fonts & FontStyles */

TextStyle titlePageStyle = TextStyle(
  color: crWhite,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: fontFamily,
);

TextStyle textStyle = TextStyle(
  color: crWhite,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  fontFamily: fontFamily,
);

TextStyle tabTextStyle = TextStyle(
  color: crWhite,
  fontSize: 15,
  fontWeight: FontWeight.bold,
  fontFamily: fontFamily,
);

TextStyle buttonTextStyle = TextStyle(
  color: crBlack,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: fontFamily,
);

TextStyle hintTextStyle = TextStyle(
  color: crWhite,
  fontSize: 15,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
);

/* TextFields styles */

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius1),
);

/* Custom Widgets styles */

/* Custom AppBar */

TextStyle appbarTextStyle = TextStyle(
  color: crWhite,
  fontSize: 14,
  fontFamily: fontFamily,
  fontWeight: FontWeight.normal,
);

TextStyle appbarDescriptionStyle = TextStyle(
  color: crWhite,
  fontSize: 18,
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
);

TextStyle linkStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  fontFamily: fontFamily,
);
