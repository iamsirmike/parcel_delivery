import 'package:flutter/material.dart';
import 'package:parcel_delivery/router/router_constants.dart';
import 'package:parcel_delivery/screens/Widgets/custom_flat_button.dart';
import 'package:parcel_delivery/screens/index/widgets/drawer_item.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/fontstyle.dart';
import 'package:parcel_delivery/utils/responsive.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/1.jpg'),
                  radius: 30,
                ),
                title: Text(
                  'Michael',
                  style: fontStyle(23, FontWeight.w600, UiColors.color3),
                ),
                subtitle: Text(
                  'View profile',
                  style: fontStyle(15, FontWeight.normal, UiColors.color4),
                ),
              ),
            ),
          ),
          DrawerItem(
            icon: Icons.credit_card,
            label: 'Payments',
            onpress: () {},
          ),
          DrawerItem(
            icon: Icons.favorite_border,
            label: 'Free deliveries',
            onpress: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, freeDeliveryPageRoute);
              
            },
          ),
          DrawerItem(
            icon: Icons.history,
            label: 'Delivery history',
            onpress: () {},
          ),
          DrawerItem(
            icon: Icons.message_outlined,
            label: 'Support',
            onpress: () {},
          ),
          DrawerItem(
            icon: Icons.error_outline,
            label: 'About',
            onpress: () {},
          ),
          SizedBox(
            height: screenHeight(context, 0.15),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomFlatButton(
              text: 'SIGN UP AS A COURIER',
              width: screenWidth(context, 1),
              onpress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
