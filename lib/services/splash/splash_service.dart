import 'dart:async';
import 'package:clean_architecture_and_blog/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.loginScreen, ((route) => false)),
    );
  }
}
