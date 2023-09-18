import 'package:flutter/material.dart';

import '../main.dart';


class LoadingIcon extends StatelessWidget {
  final String? label;
  const LoadingIcon({Key? key,this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25, width: 25, child: CircularProgressIndicator(color: primaryColor)),
          const SizedBox(height: 20),
          Text(label!),
        ],
      ),
    );
  }
}