// file: geotagging/controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pcic_app/src/geotagging/service.dart';
import 'package:latlong2/latlong.dart';
import 'package:pcic_app/src/navigation/service.dart';
import 'package:screenshot/screenshot.dart';

class GeotaggingController with ChangeNotifier {
  final GeotaggingServices geotaggingServices;
  final MapController mapController;
  final ScreenshotController screenshotController;
  final NavigationService navigationService;

  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  List<Polyline> polylines = [];
  LatLng? currentLocation;
  LatLng? initialRoutePoint;
  LatLng? endRoutePoint;
  bool isRouting = false;
  bool showPinDropConfirmation = true;
  bool dontShowAgain = false;
  double currentZoom = 18.0;

  GeotaggingController({
    required this.mapController,
    required this.screenshotController,
    required this.geotaggingServices,
    required this.navigationService,
  });

  void startLocationUpdates() {
    geotaggingServices.startLocationUpdates(
      onLocationUpdate: (LatLng location) {
        currentLocation = location;
        moveMap(location);
        notifyListeners();
      },
    );
  }

  void stopLocationUpdates() {
    geotaggingServices.stopLocationUpdates();
  }

  Future<void> saveGpxFile() async {
    await geotaggingServices.saveGpxFile(routePoints);
  }

  Future<String> captureMapScreenshot() async {
    return await geotaggingServices.captureMapScreenshot(screenshotController);
  }

  double calculateAreaOfPolygon(List<LatLng> points) {
    return geotaggingServices.calculateAreaOfPolygon(points);
  }

  double convertSquareMetersToPerimeters(double squareMeters) {
    return geotaggingServices.convertSquareMetersToPerimeters(squareMeters);
  }

  double convertSquareMetersToHectares(double squareMeters) {
    return geotaggingServices.convertSquareMetersToHectares(squareMeters);
  }

  Future<LatLng?> getCurrentLocation() async {
    return await geotaggingServices.getCurrentLocation();
  }

  void startRouting() {
    isRouting = true;
    initialRoutePoint = currentLocation;
    notifyListeners();
  }

  Future<void> stopRouting() async {
    isRouting = false;
    endRoutePoint = currentLocation;
    await saveGpxFile();
    String screenshotPath = await captureMapScreenshot();
    // TODO: Navigate to the PCICFinalView with the necessary data, including screenshotPath
    notifyListeners();
  }

  void cancelRouting() {
    isRouting = false;
    routePoints.clear();
    markers.clear();
    polylines.clear();
    initialRoutePoint = null;
    endRoutePoint = null;
    showPinDropConfirmation = true; // reset pin confirmation
    notifyListeners();
    navigateToDashboard();
  }

  void addMarkerAtCurrentLocation() {
    if (currentLocation != null) {
      addColoredMarker(currentLocation!, Colors.red);
    }
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
    routePoints.add(point);
    notifyListeners();
  }

  void removeLastMarker() {
    if (markers.isNotEmpty) {
      markers.removeLast();
      routePoints.removeLast();
      notifyListeners();
    }
  }

  void clearMarkers() {
    markers.clear();
    routePoints.clear();
    notifyListeners();
  }

  Future<void> addMarkerConfirmation(BuildContext context) async {
    bool retainPinDrop = false;

    if (showPinDropConfirmation) {
      bool? confirm = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Pin Drop'),
            content: StatefulBuilder(
              builder: (context, setState) {
                return CheckboxListTile(
                  title: const Text("Don't show this message again"),
                  value: retainPinDrop,
                  onChanged: (value) {
                    setState(() {
                      retainPinDrop = value!;
                    });
                  },
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        addMarkerAtCurrentLocation();
      }

      showPinDropConfirmation = !retainPinDrop;
    } else {
      addMarkerAtCurrentLocation();
    }
  }

  void moveMap(LatLng center) {
    mapController.move(center, currentZoom);
  }

  void zoomMap(double zoom) {
    currentZoom = zoom;
    mapController.move(mapController.center, zoom);
  }

  double getTotalArea() {
    return calculateAreaOfPolygon(routePoints);
  }

  double getTotalAreaInPerimeters() {
    return convertSquareMetersToPerimeters(getTotalArea());
  }

  double getTotalAreaInHectares() {
    return convertSquareMetersToHectares(getTotalArea());
  }

  void navigateToDashboard() {
    navigationService.navigateTo('/dashboard');
  }
}
