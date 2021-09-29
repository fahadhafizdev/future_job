import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColor = Color(0xff4141A4);
Color blackColor = Color(0xff272C2F);
Color whiteColor = Color(0xffFFFFFF);
Color lightColor = Color(0xffB3B5C4);
Color redColor = Color(0xffFD4F56);
Color greyColor = Color(0xffF1F0F5);
Color lightBorderColor = Color(0xffECEDF1);

double edge = 24;

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

TextStyle lightTextStyle = GoogleFonts.poppins(
  color: lightColor,
  fontWeight: FontWeight.w400,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: mainColor,
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: 11),
  onPrimary: whiteColor,
  primary: whiteColor,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(66),
    ),
  ),
);

final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: 11),
  onPrimary: whiteColor,
  primary: Colors.transparent,
  shadowColor: Colors.transparent,
  side: BorderSide(
    color: whiteColor,
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(66),
    ),
  ),
);

final ButtonStyle signInButtonStyle = ElevatedButton.styleFrom(
  onPrimary: mainColor,
  primary: mainColor,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(66),
    ),
  ),
);

final ButtonStyle signInButtonRedStyle = ElevatedButton.styleFrom(
  onPrimary: redColor,
  primary: redColor,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(66),
    ),
  ),
);
