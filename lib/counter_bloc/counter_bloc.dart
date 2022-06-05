import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) async {
      _handleIncomingEvents(event, emit);
    });
  }

  void _handleIncomingEvents(CounterEvent event, Emitter emitter) {
    switch (event) {
      case CounterEvent.increment:
        print("increament");
        emitter(state + 1);
        break;
      case CounterEvent.decrement:
        emitter(state - 1);
        break;
    }
  }

// @override
// void add(CounterEvent event) {
//   super.add(event);
//   switch (event) {
//     case CounterEvent.increment:
//       // TODO: Handle this case.
//       emit(state + 1);
//
//       break;
//     case CounterEvent.decrement:
//       emit(state - 1);
//       break;
//   }
// }
//
// @override
// void onEvent(CounterEvent event) {
//   super.onEvent(event);
//
//   switch (event) {
//     case CounterEvent.increment:
//       // TODO: Handle this case.
//       emit(state + 1);
//
//       break;
//     case CounterEvent.decrement:
//       emit(state - 1);
//       break;
//   }
// }

//void increment() => emit(state - 1);
//
// /// Subtract 1 from the current state.
// void decrement() => emit(state - 1);
}
