import 'package:flutter/material.dart';

import 'package:asian_taxi_sandbox/splash_screen.dart';
import 'package:asian_taxi_sandbox/google_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Splash and Token Authentication",
      routes: <String,WidgetBuilder>{
        "/GoogleMapScreen": (BuildContext context) => MyGoogleMap(),
      },
      home:
      SplashScreen(),


    );
  }

}

