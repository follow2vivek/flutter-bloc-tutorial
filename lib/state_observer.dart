import 'package:flutter_bloc/flutter_bloc.dart';

class StateObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('Event - ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType}, $error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

//Work with event based approach i.e. Bloc
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType}, $transition');
    super.onTransition(bloc, transition);
  }

}
