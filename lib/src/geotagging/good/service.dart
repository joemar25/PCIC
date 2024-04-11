// file: geotagging/service.dart
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:gpx/gpx.dart';
import 'package:screenshot/screenshot.dart';

class GeotaggingServices {
  final Location _locationController = Location();

  void startLocationUpdates({required Function(LatLng) onLocationUpdate}) {
    _locationController.onLocationChanged.listen((LocationData locationData) {
      LatLng location = LatLng(locationData.latitude!, locationData.longitude!);
      onLocationUpdate(location);
    });
  }

  void stopLocationUpdates() {
    _locationController.onLocationChanged.listen(null).cancel();
  }

  Future<List<LatLng>> getPolylinePoints(
      LatLng source, LatLng destination) async {
    // Implement the logic to fetch polyline points using the Mapbox API
    // Return the list of LatLng points
    // You can use the Mapbox Directions API for this purpose
    // Example: https://docs.mapbox.com/api/navigation/directions/
    return [];
  }

  Future<void> saveGpxFile(List<LatLng> routePoints) async {
    final gpx = Gpx();
    gpx.wpts = routePoints
        .map((point) => Wpt(lat: point.latitude, lon: point.longitude))
        .toList();
    final gpxString = GpxWriter().asString(gpx);

    var directory = await getExternalStorageDirectory();
    await getExternalStorageDirectory();
    final file = File('${directory!.path}/route.gpx');
    await file.writeAsString(gpxString);
  }

  Future<String> captureMapScreenshot(
      ScreenshotController screenshotController) async {
    final directory = await getExternalStorageDirectory();
    final file = File('${directory!.path}/map_screenshot.png');
    final uint8List = await screenshotController.capture();
    await file.writeAsBytes(uint8List!);

    return file.path;
  }

  double calculateAreaOfPolygon(List<LatLng> points) {
    if (points.length < 3) {
      return 0.0; // Not a polygon
    }
    double radius = 6378137.0; // Earth's radius in meters
    double area = 0.0;
    for (int i = 0; i < points.length; i++) {
      LatLng p1 = points[i];
      LatLng p2 = points[(i + 1) % points.length]; // Wrap around at the end

      double lat1 = p1.latitudeInRad;
      double lon1 = p1.longitudeInRad;
      double lat2 = p2.latitudeInRad;
      double lon2 = p2.longitudeInRad;

      // Calculate segment area (using spherical excess formula)
      double segmentArea = 2 *
          math.atan2(
            math.tan((lon2 - lon1) / 2) * math.tan((lat1 + lat2) / 2),
            1 + math.tan(lat1 / 2) * math.tan(lat2 / 2) * math.cos(lon1 - lon2),
          );
      area += segmentArea;
    }

    return (area * radius * radius).abs();
  }

  double convertSquareMetersToPerimeters(double squareMeters) {
    return squareMeters / 40.46;
  }

  double convertSquareMetersToHectares(double squareMeters) {
    return squareMeters / 10000;
  }

  Future<LatLng?> getCurrentLocation() async {
    try {
      LocationData locationData = await _locationController.getLocation();
      return LatLng(locationData.latitude!, locationData.longitude!);
    } catch (e) {
      debugPrint('Error getting current location: $e');
      return null;
    }
  }
}
