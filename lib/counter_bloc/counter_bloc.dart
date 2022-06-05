import 'package:flutter/foundation.dart';
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
        // emitter(null); // to force onError to get triggered
        break;
      case CounterEvent.decrement:
        emitter(state - 1);
        break;
    }
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print("onEventTriggered $event");
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print("onTransition $transition");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("onError $error StackTrace $stackTrace");
  }
}
