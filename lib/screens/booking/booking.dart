import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parcel_delivery/controllers/booking_controller.dart';
import 'package:parcel_delivery/provider/location_provider.dart';
import 'package:parcel_delivery/screens/Widgets/action_button.dart';
import 'package:parcel_delivery/screens/booking/widgets/booking_form.dart';
import 'package:parcel_delivery/utils/colors.dart';
import 'package:parcel_delivery/utils/responsive.dart';
import 'package:provider/provider.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
  final String pickup;
  final String dropoff;
  Booking({this.pickup, this.dropoff});
}

class _BookingState extends State<Booking> {
  BookingController bookingController = BookingController();
  getDropoffLocation(context) async {
    try {
      Provider.of<LocationProvider>(context, listen: false).calculateDistance();
      Provider.of<LocationProvider>(context, listen: false).startAddress =
          widget.pickup;
      Provider.of<LocationProvider>(context, listen: false).dropoffAddress =
          widget.dropoff;
    } catch (e) {
      Fluttertoast.showToast(msg: e);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      getDropoffLocation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<LocationProvider>(
            builder: (context, data, child) {
              return Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        height: screenHeight(context, 0.4),
                        child: GoogleMap(
                          markers: data.markers != null
                              ? Set<Marker>.from(data.markers)
                              : null,
                          myLocationButtonEnabled: false,
                          myLocationEnabled: true,
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              data.currentLatitude ?? 6.6666004,
                              data.currentLongitude ?? -1.6162709,
                            ),
                            zoom: 14.0,
                          ),
                          // polylines: Set<Polyline>.of(data.polylines.values),
                          onMapCreated: (GoogleMapController controller) {
                            data.mapController = controller;
                          },
                        ),
                      ),
                      ActionButton(
                        icon: Icons.arrow_back,
                        onpress: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Container(
                    height: screenHeight(context, 0.55),
                    width: screenWidth(context, 1),
                    decoration: BoxDecoration(
                      color: UiColors.color1,
                    ),
                    child: BookingForm(bookingController: bookingController),
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

