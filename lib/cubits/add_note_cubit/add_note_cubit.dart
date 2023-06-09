import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notter/constants.dart';
import 'package:notter/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  // start logic from here
  addNote(NoteModel note) async {

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
      emit(AddNoteFailure(e.toString()));
    }
  }
}
