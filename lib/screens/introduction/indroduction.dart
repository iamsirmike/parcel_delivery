import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parcel_delivery/router/router_constants.dart';
import 'package:parcel_delivery/screens/Widgets/custom_flat_button.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/fontstyle.dart';
import 'package:parcel_delivery/utils/responsive.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.color1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 50),
          child: Column(
            children: [
              Container(
                height: screenHeight(context, 0.4),
                width: screenWidth(context, 1),
                child: SvgPicture.asset('assets/svgs/intro.svg'),
              ),
              Spacer(),
              Text(
                'Delivery To Your Address',
                style: fontStyle(24, FontWeight.w700, UiColors.color3),
              ),
              SizedBox(
                height: screenHeight(context, 0.03),
              ),
              Text(
                'Our courriers will get adjusted to your customers schedule. As a result - everyone is pleased!',
                textAlign: TextAlign.center,
                style: fontStyle(15, FontWeight.w400, UiColors.color4),
              ),
              SizedBox(
                height: screenHeight(context, 0.1),
              ),
              CustomFlatButton(
                width: 180,
                text: 'Get Started',
                onpress: () {
                  Navigator.pushReplacementNamed(context, indexPageRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
