import 'package:asian_taxi_sandbox/widgets/brandDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:asian_taxi_sandbox/widgets/customBottomBar.dart';
import 'package:asian_taxi_sandbox/widgets/custopAppBar.dart';
import 'src/locations.dart' as locations;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:asian_taxi_sandbox/widgets/brandCard.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:geocoder/geocoder.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMap createState() => _MyGoogleMap();
}

class _MyGoogleMap extends State<MyGoogleMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(49.988358, 36.232845);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/GoogleMapScreen");
  }

//  Future<void> _onMapCreated(GoogleMapController controller) async {
//    print ('asdasd');
//    final googleOffices = await locations.getGoogleOffices();
//    setState(() {
//      _markers.clear();
//      for (final office in googleOffices.offices) {
//        final marker = Marker(
//          markerId: MarkerId(office.name),
//          position: LatLng(office.lat, office.lng),
//          infoWindow: InfoWindow(
//            title: office.name,
//            snippet: office.address,
//          ),
//        );
//        _markers[office.name] = marker;
//      }
//    });
//  }

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(49.988358, 36.232845),
    tilt: 59.440,
    zoom: 11,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    setState(() {
      controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
    });
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a Title',
            snippet: 'This is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  Widget Button(Function function, IconData icon) {
    return CupertinoButton(
      onPressed: function,
      padding: const EdgeInsets.all(0),
      child: Icon(icon, size: 36),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: BrandDrawer(),
        appBar: MyCustomAppBar(height: 50),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11,
              ),
              onCameraMove: _onCameraMove,
              mapType: _currentMapType,
              markers: _markers,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Button(_onMapTypeButtonPressed, Icons.map),
                      SizedBox(
                        height: 13.0,
                      ),
                      Button(_onAddMarkerButtonPressed, Icons.add_location),
                      SizedBox(
                        height: 13.0,
                      ),
                      Button(_goToPosition1, Icons.location_searching),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: MyCustomBottomBar(height: 50),
      ),
    );
  }
}
