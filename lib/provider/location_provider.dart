import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  double currentLatitude;
  double currentLongitude;
  Position position;
  var currentAddress;
  var startAddress;
  var dropoffAddress;
  double totalDistance = 0.0;
  bool gotPosition = false;
  GoogleMapController mapController;
  Set<Marker> markers = {};
  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  Future getUserLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
      gotPosition = true;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLatitude,
              currentLongitude,
            ),
            zoom: 14.0,
          ),
        ),
      );
      getAddress();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  toggleTextBoxesView() {
    gotPosition = true;
    notifyListeners();
  }

  getAddress() async {
    try {
      // Places are retrieved using the coordinates
      List<Placemark> p =
          await placemarkFromCoordinates(currentLatitude, currentLongitude);
      // Taking the most probable result
      Placemark place = p[0];
      // Structuring the address
      currentAddress = "${place.subLocality},${place.street}";
      startAddress = currentAddress;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  // Method for calculating the distance between two places
  Future<bool> calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(startAddress);
      List<Location> dropoffPlacemark =
          await locationFromAddress(dropoffAddress);

      if (startPlacemark != null && dropoffPlacemark != null) {
        // Use the retrieved coordinates of the current position,
        // instead of the address if the start position is user's
        // current position, as it results in better accuracy.
        Position startCoordinates = startAddress == currentAddress
            ? Position(latitude: currentLatitude, longitude: currentLongitude)
            : Position(
                latitude: startPlacemark[0].latitude,
                longitude: startPlacemark[0].longitude);
        Position dropoffCoordinates = Position(
            latitude: dropoffPlacemark[0].latitude,
            longitude: dropoffPlacemark[0].longitude);

        //clear markers
        if (markers.isNotEmpty) markers.clear();
        // Start Location Marker
        Marker startMarker = Marker(
          markerId: MarkerId('$startCoordinates'),
          position: LatLng(
            startCoordinates.latitude,
            startCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Pickup location',
            snippet: startAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // dropoff Location Marker
        Marker dropoffMarker = Marker(
          markerId: MarkerId('$dropoffCoordinates'),
          position: LatLng(
            dropoffCoordinates.latitude,
            dropoffCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Dropoff location',
            snippet: dropoffAddress,
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        );

        // Adding the markers to the list
        markers.add(startMarker);
        markers.add(dropoffMarker);

        print('START COORDINATES: $startCoordinates');
        print('dropoff COORDINATES: $dropoffCoordinates');

        Position _northeastCoordinates;
        Position _southwestCoordinates;

        // Calculating to check that the position relative
        // to the frame, and pan & zoom the camera accordingly.
        double miny = (startCoordinates.latitude <= dropoffCoordinates.latitude)
            ? startCoordinates.latitude
            : dropoffCoordinates.latitude;
        double minx =
            (startCoordinates.longitude <= dropoffCoordinates.longitude)
                ? startCoordinates.longitude
                : dropoffCoordinates.longitude;
        double maxy = (startCoordinates.latitude <= dropoffCoordinates.latitude)
            ? dropoffCoordinates.latitude
            : startCoordinates.latitude;
        double maxx =
            (startCoordinates.longitude <= dropoffCoordinates.longitude)
                ? dropoffCoordinates.longitude
                : startCoordinates.longitude;

        _southwestCoordinates = Position(latitude: miny, longitude: minx);
        _northeastCoordinates = Position(latitude: maxy, longitude: maxx);

        // Accommodate the two locations within the
        // camera view of the map
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(
                _northeastCoordinates.latitude,
                _northeastCoordinates.longitude,
              ),
              southwest: LatLng(
                _southwestCoordinates.latitude,
                _southwestCoordinates.longitude,
              ),
            ),
            100.0,
          ),
        );
        notifyListeners();
        // Calculating the distance between the start and the end positions
        // with a straight path, without considering any route
        // totalDistance = Geolocator.bearingBetween(
        //   startCoordinates.latitude,
        //   startCoordinates.longitude,
        //   dropoffCoordinates.latitude,
        //   dropoffCoordinates.longitude,
        // );

        // await createPolylines(startCoordinates, dropoffCoordinates);

        // Calculating the total distance by adding the distance
        // between small segments
        // for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        //   totalDistance += coordinateDistance(
        //     polylineCoordinates[i].latitude,
        //     polylineCoordinates[i].longitude,
        //     polylineCoordinates[i + 1].latitude,
        //     polylineCoordinates[i + 1].longitude,
        //   );
        // }
        // notifyListeners();

        return true;
      }
    } catch (e) {
      throw e;
    }
    return false;
  }

  // Create the polylines for showing the route between two places
  // createPolylines(Position start, Position dropoff) async {
  //   polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     'AIzaSyAujcZmeAjTcucPkyJZIR_pgmD8Js1D_zo', // Google Maps API Key
  //     PointLatLng(start.latitude, start.longitude),
  //     PointLatLng(dropoff.latitude, dropoff.longitude),
  //     travelMode: TravelMode.transit,
  //   );

  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }

  //   PolylineId id = PolylineId('poly');
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.red,
  //     points: polylineCoordinates,
  //     width: 3,
  //   );
  //   polylines[id] = polyline;
  // }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  // double coordinateDistance(lat1, lon1, lat2, lon2) {
  //   var p = 0.017453292519943295;
  //   var c = cos;
  //   var a = 0.5 -
  //       c((lat2 - lat1) * p) / 2 +
  //       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  //   notifyListeners();
  //   return 12742 * asin(sqrt(a));
  // }
}
