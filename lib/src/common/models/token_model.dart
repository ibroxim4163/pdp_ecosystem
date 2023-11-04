// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenModel {
  final String refresh;
  final String access;
  final bool isSuperUser;

  const TokenModel({
    required this.refresh,
    required this.access,
    required this.isSuperUser,
  });

  TokenModel copyWith({
    String? refresh,
    String? access,
    bool? isSuperUser,
  }) {
    return TokenModel(
      refresh: refresh ?? this.refresh,
      access: access ?? this.access,
      isSuperUser: isSuperUser ?? this.isSuperUser,
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'refresh': refresh,
      'access': access,
      "is_superuser": isSuperUser,
    };
  }

  factory TokenModel.fromMap(Map<String, Object?> map) {
    return TokenModel(
      refresh: map['refresh'] as String,
      access: map['access'] as String,
      isSuperUser: map["is_superuser"] as bool,
    );
  }

  @override
  String toString() =>
      'TokenModel(refresh: $refresh, access: $access, isSuperUser: $isSuperUser)';

  @override
  bool operator ==(covariant TokenModel other) {
    if (identical(this, other)) return true;

    return other.refresh == refresh &&
        other.access == access &&
        other.isSuperUser == isSuperUser;
  }

  @override
  int get hashCode => refresh.hashCode ^ access.hashCode ^ isSuperUser.hashCode;
}
