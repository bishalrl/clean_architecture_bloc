import 'package:clean_architecture_and_blog/bloc/login_bloc.dart';
import 'package:clean_architecture_and_blog/views/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  final formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: BlocProvider(
            create: (context) => loginBloc,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmailInputWidget(
                          emailFocusNode: emailFocusNode,
                          passwordFocusNode: passwordFocusNode),
                      const SizedBox(height: 20),
                      PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                      const SizedBox(height: 20),
                      Loginbutton(formKey: formKey)
                    ],
                  )),
            )));
  }
}
