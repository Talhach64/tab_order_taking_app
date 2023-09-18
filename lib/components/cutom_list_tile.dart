import 'package:flutter/material.dart';
import '../main.dart';

class MyListTile extends StatelessWidget {
  final Widget icon;
  final Text label;
  final  VoidCallback onTap;

  const MyListTile({Key? key,required this.label,required this.icon,required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: label,
      selectedColor: primaryColor,
    );
  }
}