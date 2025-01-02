import 'package:clean_architecture_and_blog/config/components/internet_exception.dart';
import 'package:clean_architecture_and_blog/config/components/loading_widget.dart';
import 'package:clean_architecture_and_blog/config/components/round_button.dart';
import 'package:clean_architecture_and_blog/config/data/exception/app_exception.dart';
import 'package:clean_architecture_and_blog/config/routes/routes_name.dart';
import 'package:clean_architecture_and_blog/services/splash/splash_service.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw NoInternetException('');
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
