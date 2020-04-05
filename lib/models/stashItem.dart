import 'package:sew_your_stash/models/fabric.dart';

import 'branding.dart';

class StashItem implements Fabric {
    @override
    String type;
    @override
    String subType;
    @override
    int weight;
    @override
    String weightUnit;
    @override
    Map<String, int> fiberContent;
    @override
    int width;
    @override
    String widthUnit;
    @override
    String intendedUse;
    @override
    Branding branding;
    @override
    List<String> tags;
    @override
    int yardageTotal;
    @override
    String yardageUnit;

    StashItem({
      this.type, this.subType, this.weight, this.weightUnit,
      this.fiberContent, this.width, this.widthUnit, this.intendedUse, 
      this.branding, this.tags, this.yardageTotal, this.yardageUnit});

   static Map<String, int> fiberMap(Map parsedJson) {
      List<String> values = List.from(parsedJson.keys);

      Map<String, int> fiberContents = Map();

      for (String key in values) {
        fiberContents.putIfAbsent(key, () => parsedJson[key] as int);
      }

      return fiberContents;
    }

    factory StashItem.fromJson(Map parsedJson) {
      return StashItem(
        type: parsedJson.containsKey('type') ? parsedJson['type'] : null,
        subType: parsedJson.containsKey('subType') ? parsedJson['subType'] : null,
        weight: parsedJson.containsKey('weight') ? parsedJson['weight'] : null,
        weightUnit: parsedJson.containsKey('weightUnit') ? parsedJson['weightUnit'] : null,
        fiberContent: parsedJson.containsKey('fiberContent') ? fiberMap(parsedJson['fiberContent']) : null, 
        yardageTotal: parsedJson.containsKey('yardageTotal') ? parsedJson['yardageTotal'] : null,
        yardageUnit: parsedJson.containsKey('yardageUnit') ? parsedJson['yardageUnit'] : null,
        width: parsedJson.containsKey('width') ? parsedJson['width'] : null,
        widthUnit: parsedJson.containsKey('widthUnit') ? parsedJson['widthUnit'] : null,
        intendedUse: parsedJson.containsKey('intendedUse') ? parsedJson['intendedUse'] : null,
        branding: parsedJson.containsKey('branding') ? Branding.fromJson(parsedJson['branding']) : null,
        tags: parsedJson.containsKey('tags') ? List<String>.from(parsedJson['tags']) : null
      );
    }

    Map<String, dynamic> toJson() => {
      'type': type,
      'subType': subType,
      'weight': weight,
      'weightUnit': weightUnit,
      //'fiberContent': fiberContent,
      'width': width,
      'widthUnit': widthUnit,
      'intendedUse': intendedUse,
      'branding': branding.toJson(),
      'tags': tags,
      'yardageTotal': yardageTotal,
      'yardageUnit': yardageUnit
    };
}