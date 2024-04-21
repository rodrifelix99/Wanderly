import 'package:wanderly/models/category_ids.dart';

class FeatureProperties {
  int? osmId;
  int? osmType;
  double? distance;
  CategoryIds? categoryIds;
  String? name;
  String? address;
  String? website;
  String? openingHours;
  String? wheelchair;
  String? fee;


  FeatureProperties(
      {this.osmId,
      this.osmType,
      this.distance,
      this.categoryIds,
      this.name,
      this.address,
      this.website,
      this.openingHours,
      this.wheelchair,
      this.fee});

  factory FeatureProperties.fromJson(Map<String, dynamic> json) {
    return FeatureProperties(
      osmId: json['osm_id'],
      osmType: json['osm_type'],
      distance: json['distance'],
      categoryIds: json['category_ids'] != null ? CategoryIds.fromJson(json['category_ids']) : null,
      name: json['osm_tags']?['name'],
      address: json['osm_tags']?['address'],
      website: json['osm_tags']?['website'],
      openingHours: json['osm_tags']?['opening_hours'],
      wheelchair: json['osm_tags']?['wheelchair'],
      fee: json['osm_tags']?['fee'],
    );
  }
}
