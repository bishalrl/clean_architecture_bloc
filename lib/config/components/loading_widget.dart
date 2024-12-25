import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              color: Colors.blue,
            )
          : const CupertinoActivityIndicator(
              color: (Colors.blue),
            ),
    );
  }
}
