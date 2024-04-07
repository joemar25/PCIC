import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pcic_app/src/geotagging/geotagging_service.dart';

class GeotaggingController with ChangeNotifier {
  GeotaggingController(this._geotaggingServices);

  final GeotaggingServices _geotaggingServices;

  List<Marker> markers = [];
  List<Polyline> polylines = [];
  LatLng? currentLocation;

  void startLocationUpdates() {
    _geotaggingServices.startLocationUpdates(
        onLocationUpdate: (LatLng location) {
      currentLocation = location;
      notifyListeners();
    });
  }

  void stopLocationUpdates() {
    _geotaggingServices.stopLocationUpdates();
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

  void addColoredMarker(LatLng point, Color color) {
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: point,
        child: const Icon(
          Icons.location_on,
          color: Colors.green,
          size: 40.0,
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> addMarkerAtCurrentLocation() async {
    // TODO: Implement addMarkerAtCurrentLocation
  }

  void removeLastMarker() {
    // TODO: Implement removeLastMarker
  }

  void clearMarkers() {
    // TODO: Implement clearMarkers
  }

  Future<void> saveGpxFile() async {
    // TODO: Implement saveGpxFile
  }

  void startRouting() {
    // TODO: Implement startRouting
  }

  void stopRouting() {
    // TODO: Implement stopRouting
  }

  void cancelRouting() {
    // TODO: Implement cancelRouting
  }

  Future<LatLng?> getCurrentLocation() async {
    // TODO: Implement getCurrentLocation
    return null;
  }

  void trackRoutePoints() {
    // TODO: Implement trackRoutePoints
  }

  Future<void> saveMapScreenshot() async {
    // TODO: Implement saveMapScreenshot
  }

  Future<void> addMarkerConfirmation() async {
    // TODO: Implement addMarkerConfirmation
  }

  Future<void> saveRoute() async {
    // TODO: Implement saveRoute
  }

  Future<void> captureMapScreenshot() async {
    // TODO: Implement captureMapScreenshot
  }

  void moveMap(LatLng center) {
    // TODO: Implement moveMap
  }

  Widget buildMap() {
    // TODO: Implement buildMap
    return Container();
  }

  void zoomMap(double zoom) {
    // TODO: Implement zoomMap
  }

  double getTotalArea() {
    // TODO: Implement getTotalArea
    return 0.0;
  }

  double getTotalAreaInPerimeters() {
    // TODO: Implement getTotalAreaInPerimeters
    return 0.0;
  }

  double getTotalAreaInHectares() {
    // TODO: Implement getTotalAreaInHectares
    return 0.0;
  }
}
