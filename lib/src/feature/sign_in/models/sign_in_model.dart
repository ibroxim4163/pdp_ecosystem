class SignInModel {
  final String username;
  final String password;
  
  const SignInModel({
    required this.username,
    required this.password,
  });

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'username': username,
      'password': password,
    };
  }

  factory SignInModel.fromMap(Map<String, Object?> map) {
    return SignInModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

 }
