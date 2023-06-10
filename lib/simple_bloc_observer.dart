import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Debug on Change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Debug on Close: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Debug on Create: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Debug on Create: $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('Debug on Create: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('Debug on Create: $transition');
  }
}
