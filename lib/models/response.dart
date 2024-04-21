import 'package:wanderly/models/feature.dart';

class ApiResponse {
  String type;
  List<Feature> features;

  ApiResponse({required this.type, required this.features});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      type: json['type'],
      features: List<Feature>.from(json['features'].map((x) => Feature.fromJson(x))),
    );
  }
}