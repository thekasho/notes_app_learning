import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../constants.dart';
import '../../models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes () {

    try {
      // define our hive worker
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      // load all notes from hive
      List<NoteModel> notes = notesBox.values.toList();

      // return state of success
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
