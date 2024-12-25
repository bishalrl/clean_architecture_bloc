import 'package:clean_architecture_and_blog/config/components/round_button.dart';
import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  final VoidCallback onPressed;
  const InternetException({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        const Icon(Icons.wifi_off, size: 100),
        const SizedBox(height: 20),
        RoundButton(
            height: 60, width: 200, onPressed: () {}, title: 'Try Again'),
      ],
    );
  }
}
