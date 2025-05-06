import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarker {
  static Marker createMarker({
    required String id,
    required LatLng position,
    required String title,
  }) {
    return Marker(
      markerId: MarkerId(id),
      position: position,
      infoWindow: InfoWindow(title: title),
    );
  }
}
