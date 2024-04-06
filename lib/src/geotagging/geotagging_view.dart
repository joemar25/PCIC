import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

import 'geotagging_controller.dart';

class GeotaggingView extends StatelessWidget {
  static const routeName = '/geotagging';

  final GeotaggingController controller;

  const GeotaggingView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geotagging'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return FlutterMap(
            options: const MapOptions(
              center: LatLng(37.4223, -122.0848),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/quanbysolutions/cluhoxol502q801oi8od2cmvz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicXVhbmJ5c29sdXRpb25zIiwiYSI6ImNsdWhrejRwdDJyYnAya3A2NHFqbXlsbHEifQ.WJ5Ng-AO-dTrlkUHD_ebMw',
                tileProvider: CancellableNetworkTileProvider(),
              ),
              MarkerLayer(
                markers: controller.markers.map((marker) {
                  return Marker(
                    width: 80.0,
                    height: 80.0,
                    point: marker.point,
                    child: const Icon(Icons.location_on),
                  );
                }).toList(),
              ),
              PolylineLayer(polylines: controller.polylines),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getCurrentLocation();
        },
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
