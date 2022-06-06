import 'package:bloc/bloc.dart';

import '../model/features_model.dart';

class HomePageBloc extends Cubit<List<Features>> {
  HomePageBloc() : super([]);

  fetchData() {
    List<Features> list = [
      const Features(
          id: 0, title: "Counter Bloc", body: "Use Bloc to build counter app"),
      const Features(
          id: 1, title: "Counter Cubit", body: "Use Cubit to build counter app")
    ];

    emit(list);
  }
}
