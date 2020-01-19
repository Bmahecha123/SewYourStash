class Branding {
  String brand;
  String designer;

  Branding({this.brand, this.designer});

  factory Branding.fromJson(Map parsedJson) {
    return Branding(
      brand: parsedJson['brand'],
      designer: parsedJson['designer']
    );
  }

  Map<String, dynamic> toJson() => {
    'brand': brand,
    'designer': designer
  };
}