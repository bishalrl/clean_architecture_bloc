import 'package:clean_architecture_and_blog/config/components/internet_exception.dart';
import 'package:clean_architecture_and_blog/config/components/loading_widget.dart';
import 'package:clean_architecture_and_blog/config/components/round_button.dart';
import 'package:clean_architecture_and_blog/config/data/exception/app_exception.dart';
import 'package:clean_architecture_and_blog/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
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
          child: Column(
            children: [
              const LoadingWidget(
                size: 60,
              ),
              InternetException(
                onPressed: () {},
              ),
              SizedBox(height: 20),
              RoundButton(
                  height: 50, width: 150, onPressed: () {}, title: 'Home'),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.homeScreen);
                  },
                  child: Text('Home')),
            ],
          ),
        ),
      ),
    );
  }
}
