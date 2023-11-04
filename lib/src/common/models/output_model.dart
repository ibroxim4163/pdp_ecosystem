

import 'package:equatable/equatable.dart';

import '../../feature/output/widgets/output_dialog.dart';

/// use when getting output

class OutputModel extends Equatable{
  final int id;
  final String product;
  final int count;
  final Filials filial;
  final DateTime date;

  const OutputModel({
    required this.id,
    required this.product,
    required this.count,
    required this.filial,
    required this.date,
  });

  OutputModel copyWith({
    int? id,
    String? product,
    int? count,
    Filials? filial,
    DateTime? date,
  }) {
    return OutputModel(
      id: id ?? this.id,
      product: product ?? this.product,
      count: count ?? this.count,
      filial: filial ?? this.filial,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'OutputModel(id: $id, product: $product, count: $count, filial: $filial, date: $date)';
  }


  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'product_name': product,
      'count': count,
      'filial': filial.backend,
      'date': date.toIso8601String(),
    };
  }

  factory OutputModel.fromJson(Map<String, Object?> map) {
    return OutputModel(
      id: map['id'] as int,
      product: map['product_name'] as String,
      count: map['count'] as int,
      filial: Filials.values.where((e) => e.backend==(map['filial'] as String)).first,
      date: DateTime.tryParse(map['date'] as String) ?? DateTime.now(),
    );
  }
  
  @override
  List<Object?> get props => [id,product,count,filial,date];
}
