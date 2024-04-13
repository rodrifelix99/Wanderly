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
}
