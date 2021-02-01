import 'package:flutter/material.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/fontstyle.dart';

class ReusableOutlineButton extends StatelessWidget {
  final Function onpress;
  final String text;
  final double width;

  const ReusableOutlineButton({
    this.onpress,
    this.text,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      child: OutlineButton(
        onPressed: onpress,
        borderSide: BorderSide(color: UiColors.color4, width: 0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          child: Text(
            text,
            style: fontStyle(16, FontWeight.normal, UiColors.color3),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
