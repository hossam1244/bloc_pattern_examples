import 'package:flutter_bloc/flutter_bloc.dart';

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
        emitter(state + 1);
        break;
      case CounterEvent.decrement:
        emitter(state - 1);
        break;
    }
  }
}
