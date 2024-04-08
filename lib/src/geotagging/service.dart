import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

class GeotaggingServices {
  final Location _locationController = Location();

  void startLocationUpdates({required Function(LatLng) onLocationUpdate}) {
    _locationController.onLocationChanged.listen((LocationData locationData) {
      onLocationUpdate(LatLng(locationData.latitude!, locationData.longitude!));
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
}
