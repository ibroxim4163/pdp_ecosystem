import 'package:equatable/equatable.dart';

/// use when getting category products

class ProductModel extends Equatable {
  final int id;
  final String name;
  final int rating;
  final int count;

  const ProductModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.count,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    int? rating,
    int? count,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      count: count ?? this.count,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, rating: $rating, count: $count)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.rating == rating &&
        other.count == count;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ rating.hashCode ^ count.hashCode;
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'name': name,
      'rating': rating,
      'count': count,
    };
  }

  factory ProductModel.fromJson(Map<String, Object?> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      rating: map['rating'] as int,
      count: map['count'] as int,
    );
  }

  @override
  List<Object?> get props => [id, name, rating, count];
}
