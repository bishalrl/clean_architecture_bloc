// TODO Implement this library.import 'package:flutter/material.dart';

import 'package:clean_architecture_and_blog/bloc/login_bloc.dart';
import 'package:clean_architecture_and_blog/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget(
      {super.key,
      required this.emailFocusNode,
      required this.passwordFocusNode});
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, State) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
            focusNode: emailFocusNode,
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              if (!Validations.isEmail(value)) {
                return 'Please enter a valid email';
              }

              return null;
            },
          );
        });
  }
}
