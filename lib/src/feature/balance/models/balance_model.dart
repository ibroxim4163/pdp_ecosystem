import 'package:equatable/equatable.dart';

class BalanceModel extends Equatable {
  final String from;
  final String until;

  const BalanceModel({
    required this.from,
    required this.until,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'start_date': from,
      'end_date': until,
    };
  }

  factory BalanceModel.fromJson(Map<String, dynamic> map) {
    return BalanceModel(
      from: map['start_date'] as String,
      until: map['end_date'] as String,
    );
  }

  @override
  String toString() => 'BalanceModel(from: $from, until: $until)';

  @override
  List<Object?> get props => [from, until];
}
