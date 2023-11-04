class PostedInputModel {
  final int id;
  final int product;
  final int count;
  final String price;
  final DateTime date;

  const PostedInputModel({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
    required this.date,
  });

  

  PostedInputModel copyWith({
    int? id,
    int? product,
    int? count,
    String? price,
    DateTime? date,
  }) {
    return PostedInputModel(
      id: id ?? this.id,
      product: product ?? this.product,
      count: count ?? this.count,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'product': product,
      'count': count,
      'price': price,
      'date': date.toIso8601String(),
    };
  }

  factory PostedInputModel.fromJson(Map<String, dynamic> map) {
    return PostedInputModel(
      id: map['id'] as int,
      product: map['product'] as int,
      count: map['count'] as int,
      price: map['price'] as String,
      date: DateTime.tryParse(map['date'] as String)??DateTime.now(),
    );
  }


  @override
  String toString() {
    return 'PostedInputModel(id: $id, product: $product, count: $count, price: $price, date: $date)';
  }

  @override
  bool operator ==(covariant PostedInputModel other) {
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
 }
