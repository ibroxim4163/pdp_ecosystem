enum Unit {
  dona(backend: "dona", frontend: "Dona"),
  kv(backend: "kv_metr", frontend: "Kv Metr"),
  rulon(backend: "rulon", frontend: "Rulon"),
  pochka(backend: "pochka", frontend: "Pochka");

  final String frontend;
  final String backend;
  const Unit({
    required this.frontend,
    required this.backend,
  });
}

class PostProductModel {
  final int category;
  final String name;
  final int count;
  final Unit unit;
  final String price;

  const PostProductModel({
    required this.category,
    required this.name,
    required this.count,
    required this.unit,
    required this.price,
  });

  PostProductModel copyWith({
    int? category,
    String? name,
    int? count,
    Unit? unit,
    String? price,
  }) {
    return PostProductModel(
      category: category ?? this.category,
      name: name ?? this.name,
      count: count ?? this.count,
      unit: unit ?? this.unit,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return 'PostProductModel(category: $category, name: $name, count: $count, unit: $unit, price: $price)';
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'category': category,
      'name': name,
      'count': count,
      'unit': unit.backend,
      'price': price,
    };
  }

  factory PostProductModel.fromJson(Map<String, Object?> map) {
    return PostProductModel(
      category: map['category'] as int,
      name: map['name'] as String,
      count: map['count'] as int,
      unit: Unit.values
          .where(
            (element) => element.backend == (map["unit"] as String),
          )
          .first,
      price: map['price'] as String,
    );
  }
}
