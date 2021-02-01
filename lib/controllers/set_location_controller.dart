import 'package:flutter/material.dart';
import 'package:parcel_delivery/provider/location_provider.dart';
import 'package:parcel_delivery/router/router_constants.dart';
import 'package:parcel_delivery/screens/booking/booking.dart';
import 'package:provider/provider.dart';

class SetLocationController {
  static final GlobalKey<FormState> setLocationFormKey = GlobalKey<FormState>();
  String _pickupLocation;
  String _dropoffLocation;

  //getters
  String get pickuplocation => _pickupLocation;
  String get dropofflocation => _dropoffLocation;

  //setters
  set setpickupLocation(String pickupLocation) {
    if (pickupLocation != null) {
      _pickupLocation = pickupLocation;
    }
  }

  set setdropoffLocation(String dropoffLocation) {
    if (dropoffLocation != null) {
      _dropoffLocation = dropoffLocation;
    }
  }

  setLocations(context, pickup, dropoff) async {
    if (!setLocationFormKey.currentState.validate()) {
      return;
    }
    setLocationFormKey.currentState.save();
    try {
      FocusScope.of(context).requestFocus(new FocusNode());
      Navigator.pushNamed(
        context,
        bookingPageRoute,
        arguments: Booking(
          pickup: pickup,
          dropoff: dropoff,
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  getUserLocation(context) async {
    try {
      Provider.of<LocationProvider>(context, listen: false).getUserLocation();
    } catch (e) {
      throw e;
    }
  }
}
