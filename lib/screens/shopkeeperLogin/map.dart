import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Set<Marker> _markers = {};
  late String placeId = "";
  bool selected = false;

  GoogleMapController? mapController;
  LatLng _center = const LatLng(18.530823, 73.847466);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getPlaceId(String query) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final results = jsonResponse['results'];

      if (results.isNotEmpty) {
        final place = Place.fromJson(results[0]);
        setState(() {
          placeId = place.id;
          selected = true;
          // Clipboard.setData(ClipboardData(text: placeId));
          showSnackBar('Location Selected successfully', context);
        });
        final marker = Marker(
          icon: BitmapDescriptor.defaultMarker,
          visible: true,
          markerId: MarkerId(place.id),
          position: place.location,
          infoWindow: InfoWindow(
            title: place.name,
            snippet: place.id,
          ),
        );
        _markers.add(marker);
        mapController!.animateCamera(CameraUpdate.newLatLng(place.location));
      }
    }
  }

  void _handlePressButton() {
    _markers.clear;
    _getPlaceId(_searchController.text);
    // showSnackBar(placeId, context);
    _searchController.clear();
    placeId = "";
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      content,
      style: TextStyle(color: Colors.white),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Select you shop location",
          style: TextStyle(
            color: lightColor,
            fontSize: 24,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: _markers,
          ),
          Positioned(
            top: 20.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Enter Address',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _handlePressButton();
                    },
                    iconSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Visibility(
        visible: selected,
          child: Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(indibg)),
                onPressed: () {
                  Navigator.pop(context, placeId);
                },
                child: const Text("Confirm Location")),
          ),
        ),
      ),
    );
  }
}

class Place {
  final String name;
  final String id;
  final LatLng location;

  Place({
    required this.name,
    required this.id,
    required this.location,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = LatLng(
      json['geometry']['location']['lat'],
      json['geometry']['location']['lng'],
    );
    return Place(
      name: json['name'],
      id: json['place_id'],
      location: location,
    );
  }
}
