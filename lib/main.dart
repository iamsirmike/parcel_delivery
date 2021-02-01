import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcel_delivery/provider/location_provider.dart';
import 'package:parcel_delivery/router/router.dart';
import 'package:parcel_delivery/router/router_constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(
          create: (context) => LocationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: generateRoute,
        initialRoute: introRoute,
      ),
    );
  }
}
