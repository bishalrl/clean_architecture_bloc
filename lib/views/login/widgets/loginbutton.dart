import 'package:clean_architecture_and_blog/bloc/login_bloc.dart';
import 'package:clean_architecture_and_blog/utils/emums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginbutton extends StatelessWidget {
  final formKey;
  const Loginbutton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.postApiStatus == PostApiStatus.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            // Do something
          }
          if (state.postApiStatus == PostApiStatus.success) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            // Do something
          }
          if (state.postApiStatus == PostApiStatus.loading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Subbmitting...')));
            // Do something
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) => false,
            builder: (context, State) {
              return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (State.password.length < 8 || State.email.isEmpty) {
                      print('Password must be at least 8 characters');
                      return;
                    }
                    print('Login');
                    // Do something
                    context.read<LoginBloc>().add(LoginButtonPressed(
                        email: State.email, password: State.password));
                  }
                },
                child: Text('Login'),
              );
            }));
  }
}
