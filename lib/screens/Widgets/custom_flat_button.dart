import 'package:flutter/material.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/fontstyle.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({this.text, this.width, this.onpress});
  final double width;
  final String text;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      child: FlatButton(
        onPressed: onpress,
        child: Text(
          text,
          style: fontStyle(16, FontWeight.normal, UiColors.color1),
        ),
        color: UiColors.color2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
