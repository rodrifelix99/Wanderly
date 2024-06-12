import 'package:wanderly/enums/main_categories.dart';

enum Clothing {
  // Shoes
  shoe,
  boots,
  sandals,
  slippers,
  sneakers,
  loafers,
  oxfords,
  moccasins,
  espadrilles,
  flipFlops,
  clogs,
  pumps,
  wedges,
  platforms,
  mules,
  balletFlats,
  ankleBoots,
  kneeHighBoots,
  overTheKneeBoots,
  thighHighBoots,
  rainBoots,
  snowBoots,
  hikingBoots,
  workBoots,
  cowboyBoots,
  chelseaBoots,
  chukkaBoots,
  desertBoots,

  //Bottoms
  pants,
  skirts,
  shorts,
  jeans,
  leggings,
  tights,
  sweatpants,
  overalls,

  //Tops
  shirt,
  sweater,
  sweatshirt,
  tshirt,
  top,
  blouse,
  tanktop,
  cropTop,
  polo,
  turtleneck,
  hoodie,

  // Full Body
  dress,
  jumpsuit,
  romper,

  // Outerwear
  jacket,
  coat,
  vest,
  parka,
  poncho,
  cape,
  blazer,
  windbreaker,
  trenchCoat,
  raincoat,
  cardigan,
  fleece,
  pullover,
  shawl,
  wrap,
  bolero,
  kimono,
  pufferJacket,
  downJacket,
  quiltedJacket,
  bomberJacket,
  leatherJacket,
  denimJacket,
  blouson,
  fieldJacket,
  anorak,
  peaCoat,
  duffleCoat,
  overcoat,
  topcoat,
  greatcoat,
  ulster,
  chesterfield,
  reeferJacket,
  carCoat,
  mackintosh,
  mac,
  slicker,

  //Other
  unknown;

  MainCategory get mainCategory {
    switch (this) {
      case shoe:
        return MainCategory.shoes;
      case boots:
        return MainCategory.shoes;
      case sandals:
        return MainCategory.shoes;
      case slippers:
        return MainCategory.shoes;
      case sneakers:
        return MainCategory.shoes;
      case loafers:
        return MainCategory.shoes;
      case oxfords:
        return MainCategory.shoes;
      case moccasins:
        return MainCategory.shoes;
      case espadrilles:
        return MainCategory.shoes;
      case flipFlops:
        return MainCategory.shoes;
      case clogs:
        return MainCategory.shoes;
      case pumps:
        return MainCategory.shoes;
      case wedges:
        return MainCategory.shoes;
      case platforms:
        return MainCategory.shoes;
      case mules:
        return MainCategory.shoes;
      case balletFlats:
        return MainCategory.shoes;
      case ankleBoots:
        return MainCategory.shoes;
      case kneeHighBoots:
        return MainCategory.shoes;
      case overTheKneeBoots:
        return MainCategory.shoes;
      case thighHighBoots:
        return MainCategory.shoes;
      case rainBoots:
        return MainCategory.shoes;
      case snowBoots:
        return MainCategory.shoes;
      case hikingBoots:
        return MainCategory.shoes;
      case workBoots:
        return MainCategory.shoes;
      case cowboyBoots:
        return MainCategory.shoes;
      case chelseaBoots:
        return MainCategory.shoes;
      case chukkaBoots:
        return MainCategory.shoes;
      case desertBoots:
        return MainCategory.shoes;
      case pants:
        return MainCategory.bottom;
      case skirts:
        return MainCategory.bottom;
      case shorts:
        return MainCategory.bottom;
      case jeans:
        return MainCategory.bottom;
      case leggings:
        return MainCategory.bottom;
      case tights:
        return MainCategory.bottom;
      case sweatpants:
        return MainCategory.bottom;
      case overalls:
        return MainCategory.bottom;
      case shirt:
        return MainCategory.top;
      case sweater:
        return MainCategory.top;
      case sweatshirt:
        return MainCategory.top;
      case tshirt:
        return MainCategory.top;
      case top:
        return MainCategory.top;
      case blouse:
        return MainCategory.top;
      case tanktop:
        return MainCategory.top;
      case cropTop:
        return MainCategory.top;
      case polo:
        return MainCategory.top;
      case turtleneck:
        return MainCategory.top;
      case hoodie:
        return MainCategory.top;
      case dress:
        return MainCategory.fullBody;
      case jumpsuit:
        return MainCategory.fullBody;
      case romper:
        return MainCategory.fullBody;
      case jacket:
        return MainCategory.outerwear;
      case coat:
        return MainCategory.outerwear;
      case vest:
        return MainCategory.outerwear;
      case parka:
        return MainCategory.outerwear;
      case poncho:
        return MainCategory.outerwear;
      case cape:
        return MainCategory.outerwear;
      case blazer:
        return MainCategory.outerwear;
      case windbreaker:
        return MainCategory.outerwear;
      case trenchCoat:
        return MainCategory.outerwear;
      case raincoat:
        return MainCategory.outerwear;
      case cardigan:
        return MainCategory.outerwear;
      case fleece:
        return MainCategory.outerwear;
      case pullover:
        return MainCategory.outerwear;
      case shawl:
        return MainCategory.outerwear;
      case wrap:
        return MainCategory.outerwear;
      case bolero:
        return MainCategory.outerwear;
      case kimono:
        return MainCategory.outerwear;
      case pufferJacket:
        return MainCategory.outerwear;
      case downJacket:
        return MainCategory.outerwear;
      case quiltedJacket:
        return MainCategory.outerwear;
      case bomberJacket:
        return MainCategory.outerwear;
      case leatherJacket:
        return MainCategory.outerwear;
      case denimJacket:
        return MainCategory.outerwear;
      case blouson:
        return MainCategory.outerwear;
      case fieldJacket:
        return MainCategory.outerwear;
      case anorak:
        return MainCategory.outerwear;
      case peaCoat:
        return MainCategory.outerwear;
      case duffleCoat:
        return MainCategory.outerwear;
      case overcoat:
        return MainCategory.outerwear;
      case topcoat:
        return MainCategory.outerwear;
      case greatcoat:
        return MainCategory.outerwear;
      case ulster:
        return MainCategory.outerwear;
      case chesterfield:
        return MainCategory.outerwear;
      case reeferJacket:
        return MainCategory.outerwear;
      case carCoat:
        return MainCategory.outerwear;
      case mackintosh:
        return MainCategory.outerwear;
      case mac:
        return MainCategory.outerwear;
      case slicker:
        return MainCategory.outerwear;
      default:
        return MainCategory.top;
    }
  }
}
