class Profession {
  String id;
  String name;
  String description;
  int age;

  Profession({
    required this.id,
    required this.name,
    required this.description,
    required this.age,
  });

  Profession copyWith({
    String? id,
    String? name,
    String? description,
    int? age,
  }) {
    return Profession(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      age: age ?? this.age,
    );
  }
}

