// ignore_for_file: depend_on_referenced_packages

import 'package:logger/logger.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:http/http.dart' as http;

abstract class MapApi {
  static final Logger _logger = Logger();
  static final Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };
  static const String _api = 'https://api.openstreetmap.org/api/0.6';

  static Future<dynamic> searchPlaces(LatLngBounds boundBox) async {
    final response = await http.get(
      Uri.parse('$_api/nodes?bbox=${boundBox.southwest.longitude},${boundBox.southwest.latitude},${boundBox.northeast.longitude},${boundBox.northeast.latitude}'),
      headers: _headers,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load places');
    }
  }
}