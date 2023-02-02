class Character {
  final String? image;
  final String name;
  final String species;
  final String gender;
  final int yearOfBirth;
  final String actor;

  const Character({
    this.image,
    required this.name,
    required this.species,
    required this.gender,
    required this.yearOfBirth,
    required this.actor,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      image: json["image"],
      name: json["name"],
      species: json["species"],
      gender: json["gender"],
      yearOfBirth: json["yearOfBirth"],
      actor: json["actor"],
    );
  }
}
