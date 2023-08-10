class Starship {
  final String name;
  final String model;
  final String manufacturer;
  // Other properties...

  Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    // Other properties...
  });

  factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      // Map other properties from JSON
    );
  }
}
