import 'package:sew_your_stash/models/fabricItem.dart';

class Project {
  final String name;
  final String description;
  final List<FabricItem> fabricItems;

  Project({this.name, this.description, this.fabricItems});
}