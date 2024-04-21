import 'dart:math';

import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationService extends GetxService {
  final Location _location = Location();
  LocationData? _locationData;

  Future<LocationData?> getLocation() async {
    try {
      if (_locationData == null) {
        _listenLocation();
      }
      _locationData ??= await _location.getLocation();
      return _locationData;
    } catch (e) {
      rethrow;
    }
  }

  void _listenLocation() {
    _location.onLocationChanged.listen((LocationData locationData) {
      _locationData = locationData;
    });
  }

  Future<bool> isAllSettingsEnabled() async {
    final permission = await hasPermission();
    final service = await serviceEnabled();
    return permission && service;
  }

  Future<bool> hasPermission() async {
    final permission = await _location.hasPermission();
    return permission == PermissionStatus.granted;
  }

  Future<bool> requestPermission() async {
    final permission = await _location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  Future<bool> serviceEnabled() async {
    final serviceEnabled = await _location.serviceEnabled();
    return serviceEnabled;
  }

  Future<bool> requestService() async {
    final serviceEnabled = await _location.requestService();
    return serviceEnabled;
  }

  String distanceBetween(double endLatitude, double endLongitude) {
    double startLatitude = _locationData?.latitude ?? 0;
    double startLongitude = _locationData?.longitude ?? 0;
    const int radiusOfEarthKm = 6371;
    var latDistance = _toRadians(endLatitude - startLatitude);
    var lonDistance = _toRadians(endLongitude - startLongitude);

    var a = sin(latDistance / 2) * sin(latDistance / 2) +
        cos(_toRadians(startLatitude)) *
            cos(_toRadians(endLatitude)) *
            sin(lonDistance / 2) *
            sin(lonDistance / 2);

    var c = 2 * atan2(sqrt(a), sqrt(1 - a));

    var distance = radiusOfEarthKm * c * 1000; // convert to meters

    return distance < 1000
        ? '${distance.toStringAsFixed(2)} m'
        : '${(distance / 1000).toStringAsFixed(2)} km';
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }
}
