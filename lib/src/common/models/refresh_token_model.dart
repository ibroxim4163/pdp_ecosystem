class RefreshTokenModel {
  final String access;
  const RefreshTokenModel(this.access);

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'access': access,
    };
  }

  factory RefreshTokenModel.fromMap(Map<String, Object?> map) {
    return RefreshTokenModel(
      map['access'] as String,
    );
  }

  @override
  String toString() => 'RefreshTokenModel(access: $access)';
}
