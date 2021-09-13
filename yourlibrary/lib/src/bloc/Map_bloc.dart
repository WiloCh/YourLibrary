import 'dart:async';

import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yourlibrary/src/utils/map_style.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  Position? _initialPosition;
  CameraPosition get initialCameraPosition => CameraPosition(
        target: LatLng(
          _initialPosition!.latitude,
          _initialPosition!.longitude,
        ),
        zoom: 14.5,
      );

  bool _loading = true;
  bool get loading => _loading;

  late bool _gpsEnabled;
  bool get gpsEnabled => _gpsEnabled;

  StreamSubscription? _gpsSubcription, _positionSubcription;

  MapController() {
    _init();
  }

  Future<void> _init() async {
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    _loading = false;
    _gpsSubcription = Geolocator.getServiceStatusStream().listen(
      (status) async {
        _gpsEnabled = status == ServiceStatus.enabled;
        //await _getInitialPosition();
        if (_gpsEnabled) {
          _initLocationUpdates();
        }
      },
    );
    _initLocationUpdates();
  }

  Future<void> _initLocationUpdates() async {
    bool initialized = false;
    await _positionSubcription?.cancel();
    _positionSubcription = Geolocator.getPositionStream().listen(
      (position) {
        if (!initialized) {
          _setInitialPosition(position);
          initialized = true;
          notifyListeners();
        }
      },
      onError: (e) {
        print("Error ${e.runtimeType}");
        if (e is LocationServiceDisabledException) {
          _gpsEnabled = false;
          notifyListeners();
        }
      },
    );
  }

  void _setInitialPosition(Position position) {
    if (_gpsEnabled && _initialPosition == null) {
      //_initialPosition = await Geolocator.getLastKnownPosition();
      _initialPosition = position;
    }
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  Future<void> turnOnGPS() => Geolocator.openLocationSettings();

  void onTap(LatLng position) {
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true,
      onTap: () {
        print(markerId.toString());
      },
      onDragEnd: (newPosition) {
        print("new position $newPosition");
      },
    );
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _positionSubcription?.cancel();
    _gpsSubcription?.cancel();
    super.dispose();
  }
}
