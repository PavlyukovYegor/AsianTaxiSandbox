import 'package:asian_taxi_sandbox/widgets/brandDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:asian_taxi_sandbox/widgets/customBottomBar.dart';
import 'package:asian_taxi_sandbox/widgets/custopAppBar.dart';
import 'src/locations.dart' as locations;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:asian_taxi_sandbox/widgets/brandCard.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMap createState() => _MyGoogleMap();
}

class _MyGoogleMap extends State<MyGoogleMap> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/GoogleMapScreen");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: BrandDrawer(),
        appBar: MyCustomAppBar(height: 50),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
        bottomNavigationBar: MyCustomBottomBar(height: 50),
      ),
    );
  }
}
