import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yourlibrary/src/utils/map_style.dart';

class MapController {
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }
}
