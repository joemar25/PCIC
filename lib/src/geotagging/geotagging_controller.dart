import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pcic_app/src/geotagging/geotagging_service.dart';

import 'geotagging_service.dart';

class GeotaggingController extends ChangeNotifier {
  final GeotaggingServices _geotaggingServices = GeotaggingServices();
  List<Marker> markers = [];
  List<Polyline> polylines = [];

  Future<void> getCurrentLocation() async {
    LatLng? currentLocation = await _geotaggingServices.getCurrentLocation();
    markers.add(
      Marker(
        point: currentLocation ?? const LatLng(0, 0),
        child: const Icon(Icons.location_on),
      ),
    );
    notifyListeners();
  }

  Future<void> getPolylinePoints(LatLng source, LatLng destination) async {
    List<LatLng> polylineCoordinates =
        await _geotaggingServices.getPolylinePoints(source, destination);
    polylines.add(
      Polyline(
        points: polylineCoordinates,
        strokeWidth: 4.0,
        color: Colors.blue,
      ),
    );
    notifyListeners();
  }
}
