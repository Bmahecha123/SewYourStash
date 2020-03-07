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

   @override
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
        type: parsedJson['type'],
        subType: parsedJson['subType'],
        weight: parsedJson['weight'],
        weightUnit: parsedJson['weightUnit'],
        fiberContent: fiberMap(parsedJson['fiberContent']), 
        yardageTotal: parsedJson['yardageTotal'],
        yardageUnit: parsedJson['yardageUnit'],
        width: parsedJson['width'],
        widthUnit: parsedJson['widthUnit'],
        intendedUse: parsedJson['intendedUse'],
        branding: Branding.fromJson(parsedJson['branding']),
        tags: List<String>.from(parsedJson['tags'])
      );
    }

    Map<String, dynamic> toJson() => {
      'type': type,
      'subType': subType,
      'weight': weight,
      'weightUnit': weightUnit,
      'fiberContent': fiberContent,
      'width': width,
      'widthUnit': widthUnit,
      'intendedUse': intendedUse,
      'branding': branding.toJson(),
      'tags': tags,
      'yardageTotal': yardageTotal,
      'yardageUnit': yardageUnit
    };
}