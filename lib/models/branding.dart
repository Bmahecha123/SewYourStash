class Branding {
  final String brand;
  final String designer;

  Branding({this.brand, this.designer});

  factory Branding.fromJson(Map<String, dynamic> parsedJson) {
    return Branding(
      brand: parsedJson['brand'],
      designer: parsedJson['designer']
    );
  }
}