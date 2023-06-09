import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notter/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notter/simple_bloc_observer.dart';
import 'package:notter/views/notes_view.dart';
import 'constants.dart';
import 'models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // just to be able to deal with native code..
  WidgetsFlutterBinding.ensureInitialized();

  // observe bloc statue for debugging..
  Bloc.observer = SimpleBlocObserver();

  // initialize hive adaptor to be able to use it.
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(kNotesBox);

  // registe hive adaptor in order to deal with it
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
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
