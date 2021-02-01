import 'package:flutter/material.dart';
import 'package:parcel_delivery/utils/colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    @required this.onpress,
    this.icon,
  }) : super(key: key);
  final Function onpress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: GestureDetector(
        onTap: onpress,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: UiColors.color1,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(2, 0), // changes position of shadow
              ),
            ],
          ),
          child: Icon(
            icon,
            color: UiColors.color3,
          ),
        ),
      ),
    );
  }
}
