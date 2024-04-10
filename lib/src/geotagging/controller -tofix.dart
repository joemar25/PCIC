// geotagging/controller.dart
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gpx/gpx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pcic_app/src/geotagging/service.dart';
import 'package:screenshot/screenshot.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class GeotaggingController with ChangeNotifier {
  // define the controllers needed on separate file or a library to be used
  // Location Controller
  // Screenshot Controller
  // Route Points holder
  // Markers holder
  // Polylines holder
  // Current Location
  // Initial Route Point
  // End Route Point
  // Routing status
  // Confirm Pin Drop status for confirmation

  // using GeotaggingServices to GeotaggingController

  // startLocationUpdates()
  // this will return the current geolocation of the user

  // stopLocationUpdates()
  // _locationController.onLocationChanged.listen(null).cancel();

  // saveGpxFile()
  // this will save every route points to a gpx file on a directory

  // captureMapScreenshot()
  // capture the screenshot and save it to a file

  // calculateAreaOfPolygon(points)

  // double convertSquareMetersToPerimeters(double squareMeters) {
  //   return squareMeters / 40.46;
  // }

  // double convertSquareMetersToHectares(double squareMeters) {
  //   return squareMeters / 10000;
  // }

  // getCurrentLocation()

  // startRouting()

  // stopRouting()

  // cancelRouting()

  // addMarkerAtCurrentLocation()

  // void addColoredMarker(LatLng point, Color color) {
  //     Marker(
  //       width: 80.0,
  //       height: 80.0,
  //       point: point,
  //       child: const Icon(
  //         Icons.location_on,
  //         color: Colors.green,
  //         size: 40.0,
  //       ),
  //     ),
  //   );
  //   routePoints add the point
  //   notifyListeners();
  // }

  // removeLastMarker()

  // clearMarkers() {

  // addMarkerConfirmation
  // add confirmation
  // add checkbox to not show this message again

  // moveMap

  // getTotalArea()

  // getTotalAreaInPerimeters()

  // getTotalAreaInHectares()
}
