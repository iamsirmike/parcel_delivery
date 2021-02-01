import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parcel_delivery/utils/responsive.dart';

class UserLocationMap extends StatelessWidget {
  const UserLocationMap({
    Key key,
    this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context, 0.55),
      child: GoogleMap(
        markers: data.markers != null ? Set<Marker>.from(data.markers) : null,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(data.currentLatitude ?? 6.6666004,
              data.currentLongitude ?? -1.6162709),
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          data.mapController = controller;
        },
      ),
    );
  }
}
