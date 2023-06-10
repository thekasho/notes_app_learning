import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notter/cubits/notes_cubit/notes_cubit.dart';
import 'package:notter/views/widgets/add_note_bottom_sheet.dart';
import 'package:notter/views/widgets/notes_view_body.dart';

import '../constants.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              context: context,
              builder: (context) => const AddNoteBottomSheet(),
            );
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add),
        ),
        body: const SafeArea(
          child: NotesViewBody(),
        ),
      ),
    );
  }
}

