import 'package:flutter/material.dart';
import 'package:parcel_delivery/screens/Widgets/custom_flat_button.dart';
import 'package:parcel_delivery/screens/Widgets/reusable_outlined_button.dart';
import 'package:parcel_delivery/utils/colors.dart';

class DecisionCard extends StatelessWidget {
  const DecisionCard({Key key, this.userLocation, this.manualPick})
      : super(key: key);
  final Function userLocation;
  final Function manualPick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(color: UiColors.color2, width: 3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on,
              color: UiColors.color2,
            ),
          ),
          Spacer(),
          CustomFlatButton(
            width: 320,
            text: 'Set current location as pickup point',
            onpress: userLocation,
          ),
          SizedBox(
            height: 15,
          ),
          ReusableOutlineButton(
            width: 320,
            text: 'Set pickup point manually',
            onpress: manualPick,
          )
        ],
      ),
    );
  }
}
