import 'package:sew_your_stash/models/branding.dart';

class Fabric {
    final String type;
    final String subType;
    final String weight;
    final Map<String, int> fiberContent;
    final int yardage;
    final int width;
    final String intendedUse;
    final Branding branding;
    final List<String> tags;

    Fabric({this.type, this.subType, this.weight, this.fiberContent,
    this.yardage, this.width, this.intendedUse, this.branding, this.tags});

    static Map<String, int> fiberMap(Map<String, dynamic> parsedJson) {
      List<String> values = List.from(parsedJson.keys);

      Map<String, int> fiberContents = Map();

      for (String key in values) {
        fiberContents.putIfAbsent(key, () => parsedJson[key] as int);
      }

      return fiberContents;
    }

    factory Fabric.fromJson(Map<String, dynamic> parsedJson) {
      return Fabric(
        type: parsedJson['type'],
        subType: parsedJson['subType'],
        weight: parsedJson['weight'],
        fiberContent: fiberMap(parsedJson['fiberContent'] as Map<String, dynamic>), 
        yardage: parsedJson['yardage'],
        width: parsedJson['width'],
        intendedUse: parsedJson['intendedUse'],
        branding: Branding.fromJson(parsedJson['branding'] as Map<String, dynamic>),
        tags: List<String>.from(parsedJson['tags'])
      );
    }
}