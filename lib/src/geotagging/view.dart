// file: geotagging/view.dart
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'controller.dart';

class GeotaggingView extends StatefulWidget {
  static const routeName = '/geotagging';
  final GeotaggingController controller;

  const GeotaggingView({super.key, required this.controller});

  @override
  GeotaggingViewState createState() => GeotaggingViewState();
}

class GeotaggingViewState extends State<GeotaggingView> {
  late bool _isCollapsed;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _isCollapsed = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.startLocationUpdates();
      _getCurrentLocation();
    });
  }

  @override
  void dispose() {
    widget.controller.stopLocationUpdates();
    // widget.controller.mapController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    LatLng? location = await widget.controller.getCurrentLocation();
    if (location != null) {
      setState(() {
        currentLocation = location;
      });
      widget.controller.moveMap(location);
    }
  }

  Widget _buildButton(
      String label, IconData icon, bool enabled, void Function()? onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton.icon(
          onPressed: enabled ? onPressed : null,
          icon: Icon(icon),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: enabled ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? confirm = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Cancel'),
              content: const Text('Are you sure you want to cancel routing?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    widget.controller.cancelRouting();
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );

        if (confirm == true) {
          widget.controller.cancelRouting();
          return true;
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Geotagging'),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: widget.controller.mapController,
              options: MapOptions(
                center: currentLocation ?? const LatLng(13.1482, 123.7180),
                zoom: 20.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/quanbysolutions/cluhoxol502q801oi8od2cmvz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicXVhbmJ5c29sdXRpb25zIiwiYSI6ImNsdWhrejRwdDJyYnAya3A2NHFqbXlsbHEifQ.WJ5Ng-AO-dTrlkUHD_ebMw',
                  tileProvider: CancellableNetworkTileProvider(),
                ),
                if (widget.controller.markers.isNotEmpty)
                  MarkerLayer(markers: widget.controller.markers),
                PolylineLayer(polylines: widget.controller.polylines),
              ],
            ),
            if (currentLocation != null && !widget.controller.isRouting)
              Positioned(
                left: widget.controller.mapController.camera.center.longitude,
                top: widget.controller.mapController.camera.center.latitude,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 40.0,
                ),
              ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: FloatingActionButton(
                onPressed: _getCurrentLocation,
                child: const Icon(Icons.my_location),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Actions',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _isCollapsed = !_isCollapsed;
                              });
                            },
                            icon: Icon(_isCollapsed
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down),
                          ),
                        ],
                      ),
                      if (!_isCollapsed) ...[
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildButton(
                              'Drop Pin',
                              Icons.add_location,
                              true,
                              () => widget.controller
                                  .addMarkerConfirmation(context),
                            ),
                            _buildButton(
                              'Remove Pin',
                              Icons.remove,
                              widget.controller.markers.isNotEmpty,
                              widget.controller.removeLastMarker,
                            ),
                            _buildButton(
                                'Clear Pins',
                                Icons.clear_all,
                                widget.controller.markers.isNotEmpty,
                                () => widget.controller.clearMarkers()),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildButton(
                                'Start Routing',
                                Icons.play_arrow,
                                !widget.controller.isRouting,
                                widget.controller.startRouting),
                            _buildButton(
                                'Stop Routing',
                                Icons.stop,
                                widget.controller.isRouting,
                                () => widget.controller.stopRouting()),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildButton(
                              'Cancel',
                              Icons.cancel,
                              widget.controller.markers.isNotEmpty,
                              () async {
                                bool? confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirm Cancel'),
                                      content: const Text(
                                          'Are you sure you want to cancel routing?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                            widget.controller.cancelRouting();
                                          },
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (confirm != null && confirm) {
                                  widget.controller.cancelRouting();
                                }
                              },
                            ),
                            _buildButton(
                                'Save',
                                Icons.save,
                                widget.controller.routePoints.isNotEmpty,
                                () => widget.controller.saveGpxFile()),
                          ],
                        ),
                      ],
                      Text(
                        'Current Location: ${currentLocation?.latitude}, ${currentLocation?.longitude}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
