import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notter/cubits/add_note_cubit/add_note_cubit.dart';

import '../../constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: (){
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
              setState(() {});
            },
            child: ColorItem(
              color: kColors[index],
              isActive: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
