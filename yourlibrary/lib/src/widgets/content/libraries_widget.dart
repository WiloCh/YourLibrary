import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yourlibrary/src/Map_bloc.dart';

class LibrariesWidget extends StatefulWidget {
  LibrariesWidget({Key? key}) : super(key: key);

  @override
  _LibrariesWidgetState createState() => _LibrariesWidgetState();
}

class _LibrariesWidgetState extends State<LibrariesWidget> {
  final _controller = MapController();

  final _initialCameraPosition = CameraPosition(
    target: LatLng(-0.9563641, -78.6980523),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return Scaffold(
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
