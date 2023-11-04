part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent extends Equatable {
  final String username;
  final String password;

  const SignInEvent({
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [username, password];
}

class SignInUserEvent extends SignInEvent {
  const SignInUserEvent({
    required super.username,
    required super.password,
  });
}


