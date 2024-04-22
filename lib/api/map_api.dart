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
    LatLngBounds boundBox, {
    List<int> categoryIds = const [],
  }) async {
    final body = {
      {
        "request": "pois",
        "geometry": {
          "bbox": [
            [8.8034, 53.0756],
            [8.7834, 53.0456]
          ],
          "geojson": {
            "type": "Point",
            "coordinates": [8.8034, 53.0756]
          },
          "buffer": 200
        },
        "filters": {
          "category_ids": [570]
        }
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
      throw Exception('API error ${response.statusCode}');
    }
  }
}
