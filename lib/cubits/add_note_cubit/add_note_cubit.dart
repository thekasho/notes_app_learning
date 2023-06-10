import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notter/constants.dart';
import 'package:notter/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  // assign default value for color
  Color color = const Color(0xff6DA34D);

  // start logic from here
  addNote(NoteModel note) async {

    // assign imported color on adding the box
    note.color = color.value;

    // return state of loading.
    emit(AddNoteLoading());
    try {
      // define our hive worker
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      // insert data (execute process)
      await notesBox.add(note);

      // return state of success
      emit(AddNoteSuccess());
    } catch (e) {
      // return state if failure with error exception
      emit(AddNoteFailure('Error on catch: ${e.toString()}'));
      // emit(AddNoteFailure(e.toString()));
    }
  }
}
