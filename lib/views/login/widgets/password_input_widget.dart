import 'package:clean_architecture_and_blog/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({super.key, required this.passwordFocusNode});
  final FocusNode passwordFocusNode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, State) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            focusNode: passwordFocusNode,
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChanged(password: value));
            },
            onFieldSubmitted: (_) {
              passwordFocusNode.unfocus();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          );
        });
  }
}
