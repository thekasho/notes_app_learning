import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notter/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  // start logic from here
  addNote(NoteModel note) {

  }
}
