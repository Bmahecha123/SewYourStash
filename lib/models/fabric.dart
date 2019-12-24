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
}