import 'package:flutter/material.dart';

import '../../utils/colors.dart';

InputDecoration textInputDecoration({
  String hint,
  String label,
  Icon picon,
  IconButton sicon,
}) {
  return InputDecoration(
    hintText: hint,
    labelText: label,
    hintStyle: TextStyle(color: Color(0xffB0B0B0)),
    prefixIcon: picon,
    suffixIcon: sicon,
    labelStyle: TextStyle(color: Color(0xff9A9A9A)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        width: 0.6,
        color: UiColors.color4,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        width: 1,
        color: UiColors.color4,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        width: 1,
        color: UiColors.color4,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
  );
}
