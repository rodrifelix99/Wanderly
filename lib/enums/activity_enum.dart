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
        return [131, 136, 134, 310];
      case Activity.culture:
        return [133, 135, 132, 310];
      case Activity.sport:
        return [288];
      case Activity.music:
        return [150];
      case Activity.art:
        return [600];
      case Activity.nature:
        return [331, 333, 335, 338, 339];
      default:
        return [];
    }
  }

  /*
  Must be one of [101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 121, 122, 123, 124, 131, 133, 135, 136, 132, 134, 151, 152, 153, 154, 155, 156, 157, 161, 162, 163, 164, 166, 168, 169, 170, 171, 172, 174, 175, 176, 177, 178, 179, 180, 181, 182, 205, 165, 167, 191, 192, 193, 201, 202, 203, 204, 206, 207, 208, 209, 210, 211, 212, 213, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 284, 297, 298, 299, 300, 301, 302, 303, 304, 285, 305, 306, 307, 308, 309, 310, 331, 332, 333, 335, 336, 337, 338, 339, 340, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 391, 392, 393, 394, 395, 396, 397, 399, 400, 398, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 529, 530, 531, 532, 533, 493, 528, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 581, 598, 599, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 600, 601, 602, 603, 606, 597, 604, 605, 607, 608, 609, 610, 621, 622, 624, 625, 627, 623, 626]
   */

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