import 'package:flutter/material.dart';
import 'package:notter/views/widgets/custom_app_bar.dart';
import 'custom_text_fiels.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            CustomAppBar(title: 'Edit Note', icon:Icons.check),
            SizedBox(height: 20.0),
            CustomTextField(hint: 'Title'),
            SizedBox(height: 20.0),
            CustomTextField(hint: 'Content', maxLines: 4,),
          ],
        ),
      ),
    );
  }
}
