import 'package:bloc/bloc.dart';
/**
 *  A Cubit is similar to Bloc but has no notion of events and relies on methods to emit new states.
 *  Every Cubit requires an initial state which will be the state of the Cubit before emit has been called.
 *  The current state of a Cubit can be accessed via the state getter.
 */

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}
