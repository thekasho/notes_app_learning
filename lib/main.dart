import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notter/simple_bloc_observer.dart';
import 'package:notter/views/notes_view.dart';
import 'constants.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // just to be able to deal with native code..
  WidgetsFlutterBinding.ensureInitialized();

  // initialize hive adaptor to be able to use it.
  await Hive.initFlutter();

  // observe bloc statue for debugging..
  Bloc.observer = SimpleBlocObserver();

  // register hive adaptor in order to deal with it
  Hive.registerAdapter(NoteModelAdapter());

  // open our box named with const value to get, put data
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
