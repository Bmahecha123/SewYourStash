import 'package:sew_your_stash/models/fabric.dart';

class Project {
  final String name;
  final String description;
  final List<Fabric> fabric;

  Project({this.name, this.description, this.fabric});
}