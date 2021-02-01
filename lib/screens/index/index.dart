import 'package:flutter/material.dart';
import 'package:parcel_delivery/controllers/set_location_controller.dart';
import 'package:parcel_delivery/provider/location_provider.dart';
import 'package:parcel_delivery/screens/Widgets/action_button.dart';
import 'package:parcel_delivery/screens/index/widgets/decision_card.dart';
import 'package:parcel_delivery/screens/index/widgets/drawer.dart';
import 'package:parcel_delivery/screens/index/widgets/pick_location_card.dart';
import 'package:parcel_delivery/screens/index/widgets/user_location_map.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/responsive.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  SetLocationController setLocationController = SetLocationController();

  final startAddressController = TextEditingController();
  final dropoffAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<LocationProvider>(
            builder: (context, data, child) {
              startAddressController.text =
                  Provider.of<LocationProvider>(context).currentAddress;
              return Column(
                children: [
                  Stack(
                    children: <Widget>[
                      //Show map
                      UserLocationMap(
                        data: data,
                      ),
                      ActionButton(
                        icon: Icons.menu,
                        onpress: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, bottom: 10.0, top: 20),
                          child: ClipOval(
                            child: Material(
                              color: Colors.orange[100], // button color
                              child: InkWell(
                                splashColor: Colors.orange, // inkwell color
                                child: SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: Icon(Icons.my_location),
                                ),
                                onTap: () {
                                  setLocationController
                                      .getUserLocation(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: screenHeight(context, 0.4),
                    width: screenWidth(context, 1),
                    decoration: BoxDecoration(
                      color: UiColors.color1,
                    ),
                    child: Provider.of<LocationProvider>(context).gotPosition
                        ? PickLocationCard(
                            startAddressController: startAddressController,
                            dropoffAddressController: dropoffAddressController,
                            data: data,
                            onpress: () {
                              setLocationController.getUserLocation(context);
                            },
                          )
                        : DecisionCard(
                            userLocation: () {
                              setLocationController.getUserLocation(context);
                            },
                            manualPick: () {
                              data.toggleTextBoxesView();
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}



