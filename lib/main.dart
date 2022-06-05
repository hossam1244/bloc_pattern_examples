import 'package:bloc_pattern/counter_bloc/refactor_counter_page.dart';
import 'package:bloc_pattern/counter_bloc_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc/counter_bloc.dart';
import 'counter_bloc/counter_page.dart';
import 'counter_bloc_cubit/counter_view.dart';

void main() {
  runApp(const MyApp());
}

/**
 *
 * in bloc provider we provide counter bloc to counter page
 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterView(),
      ),
    );
  }
}
