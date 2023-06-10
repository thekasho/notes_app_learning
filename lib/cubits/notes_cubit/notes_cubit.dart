import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notter/constants.dart';
import 'package:notter/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes () {

    // define our hive worker
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    // load all notes from hive
    notes = notesBox.values.toList();

  }
}
