import 'package:bloc/bloc.dart';

abstract class MyEvent {}

abstract class CustomState {}

class InitState extends CustomState {}

class LoadingState extends CustomState {}

class CompletedState extends CustomState {
  late String myDate;
  CompletedState(this.myDate);
  getDate() {
    return myDate;
  }
}

class MyList extends MyEvent {
  final String data;

  MyList(this.data);
}

class CustomBloc extends Bloc<MyEvent, CustomState> {
  CustomBloc() : super(InitState()) {
    on<MyEvent>((event, emit) async {
      if (event is MyList) {
        emit(InitState());
        await Future.delayed(const Duration(seconds: 3));
        emit(LoadingState());
        await Future.delayed(const Duration(seconds: 3));
        emit(CompletedState("Here is My Data: ${event.data.toString()}"));
      }
    });
  }
}
