import 'package:sew_your_stash/models/branding.dart';
import 'package:sew_your_stash/models/fabric.dart';

class FabricItem implements Fabric {
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
    int yardageUsed;
    @override
    int yardageTotal;
    @override
    String yardageUnit;

    FabricItem({this.type, this.subType, this.weight, this.fiberContent,
    this.yardageUsed, this.yardageTotal, this.width, this.intendedUse, this.branding, this.tags, weightUnit, yardageUnit, widthUnit});

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
        weightUnit: parsedJson['weightUnit'],
        fiberContent: fiberMap(parsedJson['fiberContent'] as Map<String, dynamic>), 
        yardageUsed: parsedJson['yardageUsed'],
        yardageTotal: parsedJson['yardageTotal'],
        yardageUnit: parsedJson['yardageUnit'],
        width: parsedJson['width'],
        widthUnit: parsedJson['widthUnit'],
        intendedUse: parsedJson['intendedUse'],
        branding: Branding.fromJson(parsedJson['branding'] as Map<String, dynamic>),
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
      'yardageUsed': yardageUsed,
      'yardageTotal': yardageTotal,
      'yardageUnit': yardageUnit
    };
}