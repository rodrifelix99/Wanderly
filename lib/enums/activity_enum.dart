import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Activity {
  party,
  food,
  knowledge,
  culture,
  sport,
  music,
  art,
  nature,
  other;

  String toShortString() {
    return toString().split('.').last;
  }

  String tr() {
    return toShortString().tr;
  }

  /// Category Ids for POIs: https://raw.githubusercontent.com/GIScience/openpoiservice/main/openpoiservice/server/categories/categories.yml
  List<int> get categoryIds {
    switch (this) {
      case Activity.party:
        return [303, 561, 563, 569];
      case Activity.food:
        return [562, 566, 567, 570];
      case Activity.knowledge:
        return [130];
      case Activity.culture:
        return [130];
      case Activity.sport:
        return [140];
      case Activity.music:
        return [150];
      case Activity.art:
        return [600];
      case Activity.nature:
        return [160];
      default:
        return [];
    }
  }

  static Activity fromString(String activity) {
    switch (activity) {
      case 'party':
        return Activity.party;
      case 'food':
        return Activity.food;
      case 'knowledge':
        return Activity.knowledge;
      case 'culture':
        return Activity.culture;
      case 'sport':
        return Activity.sport;
      case 'music':
        return Activity.music;
      case 'art':
        return Activity.art;
      case 'nature':
        return Activity.nature;
      default:
        return Activity.other;
    }
  }

  IconData get icon {
    switch (this) {
      case Activity.party:
        return Icons.people_alt_rounded;
      case Activity.food:
        return Icons.restaurant_rounded;
      case Activity.knowledge:
        return Icons.school_rounded;
      case Activity.culture:
        return Icons.museum_rounded;
      case Activity.sport:
        return Icons.directions_run_rounded;
      case Activity.music:
        return Icons.music_note_rounded;
      case Activity.art:
        return Icons.palette_rounded;
      case Activity.nature:
        return Icons.landscape_rounded;
      default:
        return Icons.more_horiz_rounded;
    }
  }
}