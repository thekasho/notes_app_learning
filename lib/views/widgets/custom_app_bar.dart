import 'package:flutter/material.dart';
import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon, this.onPress}) : super(key: key);

  final String? title;
  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title',
          style: const TextStyle(fontSize: 32.0),
        ),
        const Spacer(),
        CustomSearchIcon(icon: icon, onPress: onPress,),
      ],
    );
  }
}


