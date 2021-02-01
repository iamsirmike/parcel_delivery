import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontStyle(double fontsize, FontWeight fontweight, Color txtcolor) {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      color: txtcolor,
    ),
  );
}
