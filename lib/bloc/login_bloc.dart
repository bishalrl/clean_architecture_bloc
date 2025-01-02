import 'package:bloc/bloc.dart';
import 'package:clean_architecture_and_blog/repository/auth/loginrepository.dart';
import 'package:clean_architecture_and_blog/utils/emums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //
  Loginrepository loginrepository = Loginrepository();

  LoginBloc() : super(LoginState()) {
    //
    on<EmailChanged>(_onEmialChanged);
    //
    on<PasswordChanged>(_OnPasswordChanged);
    //
    on<EmailUnfocused>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordUnfocused>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    //
    on<LoginButtonPressed>(_LoginButtonPressed);
  }
  void _onEmialChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _OnPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _LoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) {
    Map data = {
      'email': state.email,
      'password': state.password,
    };
    loginrepository.LoginApi(data).then((value) {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(error: value.error.toString()));
      } else {
        emit(state.copyWith(error: 'Login Successfull'));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(email: error.toString()));
    });
    emit(state.copyWith(email: event.email, password: event.password));
  }
}
