class FabricType {
  String type;
  List<String> subTypes;

  FabricType({this.type, this.subTypes});

  factory FabricType.fromJson(Map<String, dynamic> parsedJson) {
    return FabricType(
      type: parsedJson['type'],
      subTypes: List<String>.from(parsedJson['subTypes'])
    );
  }
}