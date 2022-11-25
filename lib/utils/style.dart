import 'package:flutter/material.dart';

// Primary
Color primaryColor = const Color(0xFFFF4C29);
// Base
Color whiteColor = const Color(0xFFFFFFFF);
Color semiWhiteColor = const Color(0xFFB2B1B9);
Color greyColor = const Color(0xFF595959);
Color semiGreyColor = const Color(0xFF6b6b6b);
// Shimmer
Color shimmerColor = const Color(0xFFDDDDDD);
Color lightColor = const Color(0xFFF7F7F7);
// alert
Color yellowColor = const Color(0xFFFFCE10);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;

TextStyle titleText(double font) =>  TextStyle(
  color: whiteColor,
  fontWeight: semibold,
  fontSize: font,
); //20 //15

TextStyle subtitleText(double font) => TextStyle(
  color: semiWhiteColor,
  fontWeight: regular,
  fontSize: font,
); //14 //13

TextStyle mediumText(double font) => TextStyle(
  color: whiteColor,
  fontWeight: medium,
  fontSize: font,
); //13