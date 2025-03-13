import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';
import 'package:latlong2/latlong.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_spaces.dart';
import '../../constants/text_styles.dart';
import '../../helpers/permission_helper.dart';
import '../../utils/buttons/expanded_filled_button.dart';

class MapDialog extends StatefulWidget {
  final Function(List<double>) onDone;
  const MapDialog({super.key, required this.onDone});

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {
  final MapController _mapController = MapController();
  LatLng? _currentPosition;
  LatLng? _selectedPosition; // New variable to track the selected position
  List<Marker> _markers = [];
  bool _isMapInitialized = false;
  bool isCameraMoved = false;
  late List<double> googlePinLocation = [];

  @override
  initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    PermissionHelper.checkLocationPermission(
      context,
      onGranted: () async {
        Position userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        setState(() {
          _currentPosition = LatLng(
            userLocation.latitude,
            userLocation.longitude,
          );
          _selectedPosition = _currentPosition; // Initialize selected position
          _markers = [
            Marker(
              width: 80.0,
              height: 80.0,
              point: _currentPosition!,
              child: Icon(Icons.location_on, color: Colors.blue, size: 40.0),
            ),
          ];

          // Initialize the googlePinLocation
          googlePinLocation = [
            _currentPosition!.latitude,
            _currentPosition!.longitude,
          ];
        });

        if (_isMapInitialized && _currentPosition != null) {
          _mapController.move(_currentPosition!, 15);
        }
      },
    );
  }

  void _onMapCreated(MapController controller) {
    setState(() {
      _isMapInitialized = true;
    });

    // Now it's safe to move the map if we have a position
    if (_currentPosition != null) {
      _mapController.move(_currentPosition!, 15);
    }
  }

  void _onPositionChanged(MapCamera position, bool hasGesture) {
    if (hasGesture) {
      setState(() {
        isCameraMoved = true;
        _selectedPosition = position.center;

        // Update googlePinLocation with the new center position
        if (_selectedPosition != null) {
          googlePinLocation = [
            _selectedPosition!.latitude,
            _selectedPosition!.longitude,
          ];
        }
      });

      log(
        "MAP MOVED TO: ${position.center.latitude}, ${position.center.longitude}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mapCenter = _currentPosition ?? LatLng(0, 0);
    final initialZoom = _currentPosition != null ? 15.0 : 2.0;
    return Dialog(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.screenPadding),
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSpaces.largeSpace,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "PIN INCIDENT LOCATION",
                style: TextStyles.semi14.copyWith(color: AppColors.primary),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: mapCenter,
                        initialZoom: initialZoom,
                        onMapReady: () {
                          _onMapCreated(_mapController);
                        },
                        onPositionChanged: _onPositionChanged,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        if (_currentPosition != null)
                          MarkerLayer(markers: _markers),
                      ],
                    ),
                  ),
                  Container(
                    decoration:
                        isCameraMoved
                            ? BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withValues(alpha: 0.5),
                                  blurRadius: 2,
                                  spreadRadius: 0.1,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              shape: BoxShape.circle,
                            )
                            : null,
                    child: Iconify(Fa6Solid.map_pin, color: AppColors.danger),
                  ),
                ],
              ),
              ExpandedFilledButton(
                title: "Done",
                onTap: () {
                  log(
                    "SELECTED LOCATION: ${googlePinLocation.first}, ${googlePinLocation.last}",
                  );
                  widget.onDone(googlePinLocation);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
