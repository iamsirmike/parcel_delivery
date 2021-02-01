import 'package:flutter/material.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/responsive.dart';

class FreeDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.color2,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenHeight(context, 0.7),
              width: screenWidth(context, 1),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: UiColors.color1,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    //TODO: Add svg and texts, remove the center widget
                    Center(
                      child: Text('Free Deliveries'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: UiColors.color1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                  //TODO: Add promo code and button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
