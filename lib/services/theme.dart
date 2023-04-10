import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  AppStyle._();
  static const double defaultPadding = 25;

  static final defaultBorderRadius = BorderRadius.circular(20);
}

Color purpleColor = const Color(0xffb72ea5);
Color orangeColor = const Color(0xffe06641);
Color pinkColor = const Color(0xff020202);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: Colors.black,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(color: Colors.white);

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

const h1Style = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);

const h2Style = TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black);

const h3Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

const h4StyleLight = TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black);

const h5StyleLight = TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black87);

const bodyTextLight = TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black45);

const subtitleLight = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black45);

final textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: const BorderSide(color: Colors.transparent),
);
