import 'package:flutter/material.dart';
import 'colorConstants.dart';

class AppStyles {
  static TextStyle regularText({
    double? height,
    Color? color,
    bool isUnderline = false,
    double? fontSize,
    FontWeight? fontWeight,
    double? wordSpacing,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.black,
      height: height,
      fontFamily: 'DMSans',
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      decoration: isUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
    );
  }

  static TextStyle semiBoldText({
    double? height,
    Color? color,
    bool isUnderline = false,
    double? fontSize,
    FontWeight? fontWeight,
    double? wordSpacing,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? ColorsConstants.white,
      height: height,
      fontFamily: 'DMSans',
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      decoration: isUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
    );
  }

  static TextStyle boldText({
    double? height,
    Color? color,
    bool isUnderline = false,
    double? fontSize,
    FontWeight? fontWeight,
    double? wordSpacing,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? ColorsConstants.white,
      height: height,
      fontFamily: 'DMSans',
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      decoration: isUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
    );
  }
}
