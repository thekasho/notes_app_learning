import 'package:flutter/material.dart';
import 'package:notter/views/widgets/custom_text_fiels.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 32.0,),
          CustomTextField(hint: 'Title'),
          SizedBox(height: 24.0,),
          CustomTextField(hint: 'Note Content', maxLines: 4),
        ],
      ),
    );
  }
}
