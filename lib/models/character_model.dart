class Character {
  final String name;
  final String height;
  final String mass;
  // Other properties...

  Character({
    required this.name,
    required this.height,
    required this.mass,
    // Other properties...
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      // Map other properties from JSON
    );
  }
}
