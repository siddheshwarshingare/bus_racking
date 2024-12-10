import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_database/firebase_database.dart';

class LiveLocvation extends StatefulWidget {
  @override
  _RealTimeUserTrackScreenState createState() => _RealTimeUserTrackScreenState();
}

class _RealTimeUserTrackScreenState extends State<LiveLocvation> {
  late GoogleMapController mapController;
  final Location locationService = Location();
  final DatabaseReference locationRef = FirebaseDatabase.instance.ref().child('user_locations');
  final Set<Marker> markers = {};
  LocationData? currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _startTracking();
  }

  Future<void> _getCurrentLocation() async {
    try {
      currentLocation = await locationService.getLocation();
      if (currentLocation != null) {
        setState(() {
          markers.add(Marker(
            markerId: const MarkerId('user_marker'),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ));
        });
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _startTracking() {
    locationService.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        
        locationRef.set({
          'latitude': currentLocation.latitude,
          'longitude': currentLocation.longitude,
        });

        setState(() {
          markers.add(Marker(
            markerId: const MarkerId('user_marker'),
            position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time User Tracking'),
      ),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: 14,
              ),
              markers: markers,
              onMapCreated: (controller) {
                mapController = controller;
              },
            ),
    );
  }
}
