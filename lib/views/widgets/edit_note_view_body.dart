import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notter/cubits/notes_cubit/notes_cubit.dart';
import 'package:notter/views/widgets/custom_app_bar.dart';
import '../../models/note_model.dart';
import 'custom_text_fiedls.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            CustomAppBar(
              onPress: (){
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(height: 20.0),
            CustomTextField(hint: widget.note.title, onChanged: (value) => title = value),
            const SizedBox(height: 20.0),
            CustomTextField(
              onChanged: (value) => content = value,
              hint: widget.note.subTitle,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
