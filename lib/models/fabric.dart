import 'branding.dart';

class Fabric {
    final String type;
    final String subType;
    final String weight;
    final Map<String, int> fiberContent;
    final int width;
    final String intendedUse;
    final Branding branding;
    final List<String> tags;

    Fabric({this.type, this.subType, this.weight,
    this.fiberContent, this.width, this.intendedUse, this.branding, this.tags});

    static Map<String, int> fiberMap(Map<String, dynamic> parsedJson) {
      return Map();
    }
}