// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:wanderly/models/response.dart';

abstract class MapApi {
  static final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': '5b3ce3597851110001cf6248557e09f3e58e4a7eb3b549012a0553be'
  };
  static const String _api = 'https://api.openrouteservice.org';

  static Future<dynamic> searchPlaces(
    LatLng geoPoint, {
    int radius = 1000,
    List<int> categoryIds = const [],
  }) async {
    final body = {
      "request": "pois",
      "geometry": {
        "geojson": {
          "type": "Point",
          "coordinates": [geoPoint.longitude, geoPoint.latitude]
        },
        "buffer": radius,
      },
      "filters": {
        "category_ids": [...categoryIds]
      }
    };
    final response = await http.post(
      Uri.parse('$_api/pois'),
      headers: _headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final ApiResponse responseJson = ApiResponse.fromJson(body);
      return responseJson;
    } else {
      throw Exception('API error ${response.statusCode}, ${response.body}');
    }
  }
}
