part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.error = '',
    this.postApiStatus = PostApiStatus.initial,
  });

  final String email;
  final String password;
  final String error;
  final PostApiStatus postApiStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [email, password, postApiStatus, error];
}
