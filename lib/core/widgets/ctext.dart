import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cText(
  String text, {
  TextAlign? textAlign,
  TextStyle? style,
  double? fontSize,
  FontWeight fontWeight = FontWeight.normal,
  Color? color,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style:
        style ??
        GoogleFonts.roboto(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
  );
}
