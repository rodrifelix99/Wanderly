import 'package:wanderly/models/feature_properties.dart';
import 'package:wanderly/models/geometry.dart';

class Feature {
  String type;
  Geometry geometry;
  FeatureProperties featureProperties;

  Feature(
      {required this.type,
      required this.geometry,
      required this.featureProperties});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      type: json['type'],
      geometry: Geometry.fromJson(json['geometry']),
      featureProperties: FeatureProperties.fromJson(json['properties']),
    );
  }
}
