import 'package:clean_architecture_and_blog/config/color/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;
  final double width;
  const RoundButton(
      {required this.height,
      required this.width,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.bottoncolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
