import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyle {
  static TextStyle Function(BuildContext context) titleLarge =
      (BuildContext context) => GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.titleLarge,
          letterSpacing: -1,
          fontWeight: FontWeight.w500);

  static TextStyle Function(BuildContext context) titleMediumLight =
      (BuildContext context) => GoogleFonts.poppins(
          letterSpacing: -1,
          textStyle: Theme.of(context).textTheme.titleMedium,
          fontWeight: FontWeight.w300);

  static TextStyle Function(BuildContext context) titleMedium =
      (BuildContext context) => GoogleFonts.poppins(
          letterSpacing: 0,
          textStyle: Theme.of(context).textTheme.titleMedium,
          fontWeight: FontWeight.w300);

  static TextStyle Function(BuildContext context) titleMediumGrey =
      (BuildContext context) => GoogleFonts.poppins(
          color: Colors.grey,
          letterSpacing: -1,
          fontWeight: FontWeight.w300,
          textStyle: Theme.of(context).textTheme.titleMedium);

  static TextStyle Function(BuildContext context) titleMediumLightWhite =
      (BuildContext context) => GoogleFonts.poppins(
          letterSpacing: -1,
          textStyle: Theme.of(context).textTheme.titleMedium,
          color: Colors.white,
          fontWeight: FontWeight.w300);

  static TextStyle Function(BuildContext context, Color color)
      titleMediumLightWhiteFunc = (BuildContext context, Color color) =>
          GoogleFonts.poppins(
              letterSpacing: -1,
              textStyle: Theme.of(context).textTheme.titleMedium,
              color: color,
              fontWeight: FontWeight.w300);

  static TextStyle Function(BuildContext context) titleMediumBold =
      (BuildContext context) => GoogleFonts.poppins(
          letterSpacing: -1,
          textStyle: Theme.of(context).textTheme.titleMedium,
          fontWeight: FontWeight.w500);

  static TextStyle Function(BuildContext context) bodySmall =
      (BuildContext context) => GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.bodySmall,
          fontWeight: FontWeight.w300);

  static TextStyle Function(BuildContext context) bodySmallGrey =
      (BuildContext context) => GoogleFonts.poppins(
          color: Colors.grey,
          textStyle: Theme.of(context).textTheme.bodySmall,
          fontWeight: FontWeight.w300);
  
  static TextStyle Function(BuildContext context) appbarStyle = 
      (BuildContext context) => GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w600);
}
