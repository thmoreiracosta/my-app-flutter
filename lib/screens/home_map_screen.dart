import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapScreen extends StatelessWidget {
  const HomeMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-23.5505, -46.6333),
          zoom: 14,
        ),
      ),
    );
  }
}
