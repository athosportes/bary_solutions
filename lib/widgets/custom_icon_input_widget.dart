import 'package:flutter/material.dart';

class CustomIconInputWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  

  const CustomIconInputWidget({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
    );
  }
}
