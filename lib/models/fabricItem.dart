import 'package:sew_your_stash/models/branding.dart';
import 'package:sew_your_stash/models/fabric.dart';

class FabricItem implements Fabric {
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
    int yardageUsed;
    int yardageTotal;

    FabricItem({this.type, this.subType, this.weight, this.fiberContent,
    this.yardageUsed, this.yardageTotal, this.width, this.intendedUse, this.branding, this.tags});

    @override
    static Map<String, int> fiberMap(Map<String, dynamic> parsedJson) {
      List<String> values = List.from(parsedJson.keys);

      Map<String, int> fiberContents = Map();

      for (String key in values) {
        fiberContents.putIfAbsent(key, () => parsedJson[key] as int);
      }

      return fiberContents;
    }

    factory FabricItem.fromJson(Map<String, dynamic> parsedJson) {
      return FabricItem(
        type: parsedJson['type'],
        subType: parsedJson['subType'],
        weight: parsedJson['weight'],
        fiberContent: fiberMap(parsedJson['fiberContent'] as Map<String, dynamic>), 
        yardageUsed: parsedJson['yardageUsed'],
        yardageTotal: parsedJson['yardageTotal'],
        width: parsedJson['width'],
        intendedUse: parsedJson['intendedUse'],
        branding: Branding.fromJson(parsedJson['branding'] as Map<String, dynamic>),
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
      'yardageUsed': yardageUsed,
      'yardageTotal': yardageTotal
    };
}