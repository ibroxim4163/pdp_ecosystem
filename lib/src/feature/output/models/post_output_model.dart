import 'package:equatable/equatable.dart';

import '../widgets/output_dialog.dart';

class PostOutputModel extends Equatable {
  final int product;
  final int count;
  final Filials filial;

  const PostOutputModel({
    required this.product,
    required this.count,
    required this.filial,
  });

  @override
  List<Object?> get props => [product, count, filial];

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'product': product,
      'count': count,
      'filial': filial.backend,
    };
  }

  factory PostOutputModel.fromJson(Map<String, Object?> map) {
    return PostOutputModel(
      product: map['product'] as int,
      count: map['count'] as int,
      filial: Filials.values.where((e) => e.backend==(map['filial'] as String)).first,
    );
  }


  PostOutputModel copyWith({
    int? product,
    int? count,
    Filials? filial,
  }) {
    return PostOutputModel(
      product: product ?? this.product,
      count: count ?? this.count,
      filial: filial ?? this.filial,
    );
  }
 }
