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
}