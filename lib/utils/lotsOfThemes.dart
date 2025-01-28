import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colorConstants.dart';

class LotOfThemes {
  static final dark14 = GoogleFonts.dmSans(
      textStyle: TextStyle(
          color: ColorsConstants.txtColorDark,
          fontWeight: FontWeight.w400,
          fontSize: 14));

  static textBold(Color color, double size) => GoogleFonts.dmSans(
      color: color, fontWeight: FontWeight.w500, fontSize: size);

  static heightMargin(double height) => SizedBox(
    height: height,
  );

  static widthMargin(double width) => SizedBox(
    height: width,
  );

  static googleFont({style}) => GoogleFonts.dmSans(
    textStyle: style,
  );

  static final googleFontHeading4 = GoogleFonts.dmSans(
    textStyle: heading4,
  );

  static final googleFontTxt14DarkBold = GoogleFonts.dmSans(
    textStyle: txt14DarkBold,
  );

  static const heading1 = TextStyle(
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.bold,
      fontSize: 20);

  static const heading2 = TextStyle(
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.normal,
      fontSize: 14);

  static const heading3 = TextStyle(
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w500,
      fontSize: 16);

  static const heading4 = TextStyle(
      color: Colors.white,
      fontFamily: "DMSans",
      fontWeight: FontWeight.normal,
      fontSize: 14);

  static final editHeading = TextStyle(
    color: ColorsConstants.textDark,
    fontWeight: FontWeight.w600,
    fontFamily: "DMSans",
    fontSize: 14,
  );

  static title(color) => TextStyle(
    color: color ?? ColorsConstants.grey,
    fontWeight: FontWeight.w400,
    fontFamily: "DMSans",
    fontSize: 25,
  );

  static subtitle(color) => TextStyle(
    color: color ?? ColorsConstants.grey,
    fontWeight: FontWeight.w400,
    fontFamily: "DMSans",
    fontSize: 12,
  );

  static txt14(color) => TextStyle(
    color: color ?? ColorsConstants.grey,
    fontWeight: FontWeight.w600,
    fontFamily: "DMSans",
    fontSize: 16,
  );

  static txt16(color) => TextStyle(
    color: color ?? ColorsConstants.grey,
    fontWeight: FontWeight.w700,
    fontFamily: "DMSans",
    fontSize: 16,
  );

  static final txt14GreenBold = TextStyle(
    color: ColorsConstants.green,
    fontWeight: FontWeight.w700,
    fontFamily: "DMSans",
    fontSize: 15,
  );

  static const txt14DarkBold = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: "DMSans",
    fontSize: 15,
  );

  static final txt14DarkSmall = TextStyle(
    color: ColorsConstants.txtColorDark,
    fontWeight: FontWeight.w500,
    fontFamily: "DMSans",
    fontSize: 13,
  );

  static final txt14WhiteSmall = TextStyle(
    color: ColorsConstants.white,
    fontFamily: "DMSans",
    fontSize: 12,
  );

  static final txt14Dark = TextStyle(
    color: ColorsConstants.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: "DMSans",
    fontSize: 14,
  );

  static final txt14Light = TextStyle(
    color: ColorsConstants.txtColorLight,
    fontWeight: FontWeight.w400,
    fontFamily: "DMSans",
    fontSize: 13,
  );

  static final txt14primary = TextStyle(
    color: ColorsConstants.grey,
    fontWeight: FontWeight.w500,
    fontFamily: "DMSans",
    fontSize: 14,
  );

  static final txt14Yellow = TextStyle(
    color: ColorsConstants.yellowColor,
    fontWeight: FontWeight.w400,
    fontFamily: "DMSans",
    fontSize: 14,
  );

  static final editHint = TextStyle(
    color: ColorsConstants.txtColorDark,
    fontWeight: FontWeight.w400,
    fontFamily: "DMSans",
    fontSize: 14,
  );

  static final text16Heading = TextStyle(
    color: ColorsConstants.textDark,
    fontWeight: FontWeight.w500,
    fontFamily: "DMSans",
    fontSize: 16,
  );

  static final text16HeadingBlue = TextStyle(
    color: ColorsConstants.txtColorDark,
    fontWeight: FontWeight.w400,
    fontFamily: "DMSans",
    fontSize: 16,
  );

  static const text16HeadingRed = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontFamily: "DMSans",
    fontSize: 14,
  );

  static const textHeading14 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: "DMSans",
    fontSize: 14,
  );

  static const textText12 = TextStyle(
      fontWeight: FontWeight.w300,
      color: Colors.black,
      fontFamily: "DMSans",
      fontSize: 12);

  static final light14 = GoogleFonts.rubik(
      textStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14));

  static final black12 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorsConstants.blackColor,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans",
          fontSize: 11));

  static final grey12 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorsConstants.grey,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans",
          fontSize: 11));

  static smallHeading1(String value) => Text(value, style: black12);

  static smallTxt1(String value) => Text(value, style: grey12);
}
