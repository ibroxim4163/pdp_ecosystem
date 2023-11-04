import 'package:equatable/equatable.dart';

class PostInputModel extends Equatable {
  final int product;
  final int count;
  final String price;

  const PostInputModel({
    required this.product,
    required this.count,
    required this.price,
  });

  PostInputModel copyWith({
    int? product,
    int? count,
    String? price,
  }) {
    return PostInputModel(
      product: product ?? this.product,
      count: count ?? this.count,
      price: price ?? this.price,
    );
  }

  @override
  String toString() => 'PostInputModel(product: $product, count: $count, price: $price)';
  
  @override
 
  List<Object?> get props => [price,product,count];

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'product': product,
      'count': count,
      'price': price,
    };
  }

  factory PostInputModel.fromJson(Map<String, Object?> map) {
    return PostInputModel(
      product: map['product'] as int,
      count: map['count'] as int,
      price: map['price'] as String,
    );
  }

 }
