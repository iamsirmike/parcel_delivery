import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parcel_delivery/router/router_constants.dart';
import 'package:parcel_delivery/screens/booking/booking.dart';
import 'package:parcel_delivery/screens/freedeliveries/free_deliveries.dart';
import 'package:parcel_delivery/screens/index/index.dart';
import 'package:parcel_delivery/screens/introduction/indroduction.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case introRoute:
      return MaterialPageRoute(builder: (context) => Introduction());
    case indexPageRoute:
      return MaterialPageRoute(builder: (context) => Index());
    case bookingPageRoute:
      final Booking args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => Booking(
          pickup: args.pickup,
          dropoff: args.dropoff,
        ),
      );
    case freeDeliveryPageRoute:
      return MaterialPageRoute(builder: (context) => FreeDelivery());
    default:
      return MaterialPageRoute(builder: (context) => Introduction());
  }
}
