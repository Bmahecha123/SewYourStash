import 'package:sew_your_stash/models/fabric.dart';

import 'branding.dart';

class StashItem implements Fabric {
    @override
    String type;
    @override
    String subType;
    @override
    String weight;
    @override
    Map<String, int> fiberContent;
    @override
    int width;
    @override
    String intendedUse;
    @override
    Branding branding;
    @override
    List<String> tags;
    int yardageTotal;

    StashItem({
      this.type, this.subType, this.weight, 
      this.fiberContent, this.width, this.intendedUse, 
      this.branding, this.tags, this.yardageTotal});

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
        fiberContent: fiberMap(parsedJson['fiberContent']), 
        yardageTotal: parsedJson['yardageTotal'],
        width: parsedJson['width'],
        intendedUse: parsedJson['intendedUse'],
        branding: Branding.fromJson(parsedJson['branding']),
        tags: List<String>.from(parsedJson['tags'])
      );
    }

    Map<String, dynamic> toJson() => {
      'type': type,
      'subType': subType,
      'weight': weight,
      'fiberContent': fiberContent,
      'width': width,
      'intendedUse': intendedUse,
      'branding': branding.toJson(),
      'tags': tags,
      'yardageTotal': yardageTotal
    };
}