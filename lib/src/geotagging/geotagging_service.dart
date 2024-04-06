import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

class GeotaggingServices {
  final Location _locationController = Location();

  Future<LatLng?> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    LocationData currentLocation = await _locationController.getLocation();
    return LatLng(currentLocation.latitude!, currentLocation.longitude!);
  }

  Future<List<LatLng>> getPolylinePoints(
      LatLng source, LatLng destination) async {
    // Implement the logic to fetch polyline points using the Mapbox API
    // Return the list of LatLng points
    // You can use the Mapbox Directions API for this purpose
    // Example: https://docs.mapbox.com/api/navigation/directions/
    return [];
  }
}
