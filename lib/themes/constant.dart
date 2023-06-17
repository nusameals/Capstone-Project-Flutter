import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorTheme {
  //primary
  static const Color primaryBlue = Color(0xFF0669BD);
  static const Color primaryBlue80 = Color(0xFF3887CA);
  static const Color primaryBlue60 = Color(0xFF6AA5D7);
  static const Color primaryBlue40 = Color(0xFF9CC3E5);
  static const Color primaryBlue20 = Color(0xFFCDE1F2);

  //secondary
  static const Color secondaryDanger = Color(0xFFB91C1C);
  static const Color secondaryWarning = Color(0xFFF59E0B);
  static const Color secondaryInfo = Color(0xFF3B82F6);

  //text & background
  //dark
  static const Color dark1 = Color(0xFF000000);
  static const Color dark2 = Color(0xFF1A1A1A);
  static const Color dark3 = Color(0xFF484848);
  static const Color dark4 = Color(0xFF7F7F7F);
  static const Color dark5 = Color(0xFFB2B2B2);

  //light
  static const Color light5 = Color(0xFFD8D8D8);
  static const Color light4 = Color(0xFFEFEFEF);
  static const Color light3 = Color(0xFFFAFAFA);
  static const Color light2 = Color(0xFFFEFEFE);
  static const Color light1 = Color(0xFFFFFFFF);
}

class ThemeText {
  static TextStyle subHeadingB18Light = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: ColorTheme.light1,
  );

  static TextStyle subHeadingB18 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: ColorTheme.dark1,
  );
  static TextStyle subHeadingB20 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: ColorTheme.dark1,
  );

  static TextStyle subHeadingR20 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: ColorTheme.dark1,
  );
  static TextStyle subHeadingR20W = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: ColorTheme.light1,
  );
  static TextStyle bodyB20 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyB18 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyT18 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyT14 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyB145 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyB165 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyB145W = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: ColorTheme.light1,
  );

  static TextStyle bodyB16 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyB14 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyB14B = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: ColorTheme.primaryBlue,
  );
  static TextStyle bodyB14Dark4 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: ColorTheme.dark4,
  );
  static TextStyle bodyR18 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyR16 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: ColorTheme.dark1,
  );

  static TextStyle bodyR14 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyR14B = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: ColorTheme.primaryBlue,
  );
  static TextStyle bodyR16B = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: ColorTheme.primaryBlue,
  );
  static TextStyle bodyR14Dark4 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: ColorTheme.dark4,
  );
  static TextStyle bodyR12 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorTheme.dark1,
  );
  static TextStyle bodyR12Dark5 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorTheme.dark5,
  );
}
