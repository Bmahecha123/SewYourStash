import 'branding.dart';

class Fabric {
    final String type;
    final String subType;
    final int weight;
    final String weightUnit;
    final Map<String, int> fiberContent;
    final int width;
    final String widthUnit;
    final String intendedUse;
    final Branding branding;
    final List<String> tags;
    final int yardageTotal;
    final String yardageUnit;

    Fabric({this.type, this.subType, this.weight, this.weightUnit,
    this.fiberContent, this.width, this.widthUnit, this.intendedUse, 
    this.branding, this.tags, this.yardageTotal, this.yardageUnit});

    static Map<String, int> fiberMap(Map<String, dynamic> parsedJson) {
      return Map();
    }
}