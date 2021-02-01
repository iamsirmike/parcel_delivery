import 'package:flutter/material.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/fontstyle.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    @required this.icon,
    @required this.label,
    @required this.onpress,
  });
  final IconData icon;
  final String label;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        leading: Icon(icon, size: 30, color: UiColors.color3),
        title: Text(
          label,
          style: fontStyle(16, FontWeight.normal, UiColors.color4),
        ),
        onTap: onpress,
      ),
    );
  }
}
