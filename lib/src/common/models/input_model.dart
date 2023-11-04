class InputModel {
  final int id;
  final String product;
  final int count;
  final String price;
  final DateTime date;

  const InputModel({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
    required this.date,
  });

  

  InputModel copyWith({
    int? id,
    String? product,
    int? count,
    String? price,
    DateTime? date,
  }) {
    return InputModel(
      id: id ?? this.id,
      product: product ?? this.product,
      count: count ?? this.count,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'InputModel(id: $id, product: $product, count: $count, price: $price, date: $date)';
  }

  @override
  bool operator ==(covariant InputModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.product == product &&
      other.count == count &&
      other.price == price &&
      other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      product.hashCode ^
      count.hashCode ^
      price.hashCode ^
      date.hashCode;
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'product_name': product,
      'count': count,
      'price': price,
      'date': date.toIso8601String(),
    };
  }

  factory InputModel.fromJson(Map<String, Object?> map) {
    return InputModel(
      id: map['id'] as int,
      product: map['product_name'] as String,
      count: map['count'] as int,
      price: map['price'] as String,
      date: DateTime.tryParse(map['date'] as String) ??DateTime.now(),
    );
  }

  
}
