import 'package:sew_your_stash/models/branding.dart';
import 'package:sew_your_stash/models/fabric.dart';

class FabricItem implements Fabric {
    @override
    final String type;
    @override
    final String subType;
    @override
    final String weight;
    @override
    final Map<String, int> fiberContent;
    @override
    final int width;
    @override
    final String intendedUse;
    @override
    final Branding branding;
    @override
    final List<String> tags;
    final int yardageUsed;

    FabricItem({this.type, this.subType, this.weight, this.fiberContent,
    this.yardageUsed, this.width, this.intendedUse, this.branding, this.tags});

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
        width: parsedJson['width'],
        intendedUse: parsedJson['intendedUse'],
        branding: Branding.fromJson(parsedJson['branding'] as Map<String, dynamic>),
        tags: List<String>.from(parsedJson['tags'])
      );
    }
}