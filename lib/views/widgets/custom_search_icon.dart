import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      width: 46.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 28.0,
        ),
      ),
    );
  }
}