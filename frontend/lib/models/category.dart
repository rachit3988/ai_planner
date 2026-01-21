class Category {
  final String id;
  final String name;
  final int priorityPoints;
  final String? description;

  Category({
    required this.id,
    required this.name,
    required this.priorityPoints,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      priorityPoints: json['priority_points'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'priority_points': priorityPoints,
      'description': description,
    };
  }
}
