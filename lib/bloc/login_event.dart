part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

//
class EmailChanged extends LoginEvent {
  const EmailChanged({required this.email});

  final String email;
  @override
  List<Object> get props => [];
}

//
class PasswordChanged extends LoginEvent {
  const PasswordChanged({required this.password});

  final String password;
  @override
  List<Object> get props => [];
}

//
class EmailUnfocused extends LoginEvent {
  const EmailUnfocused({required this.email});

  final String email;
  @override
  List<Object> get props => [email];
}

//
class PasswordUnfocused extends LoginEvent {
  const PasswordUnfocused({required this.password});

  final String password;
  @override
  List<Object> get props => [password];
}

//
class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
