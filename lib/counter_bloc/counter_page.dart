import 'package:bloc_pattern/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  /**
   *  Bloc Builder handles building a widget in resposne to bloc states
   *  <the bloc i'm dealing with, the incoming states>
   *
   *
   *  Bloc listener handles doing stuff in response to state changes, it's better to use
   *  bloc listener for things u wanna do only once like Toast, snackBar, dialogs
   *
   */

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, int>(builder: (context, state) {
              return Text('you have pushed the button $state times');
            }),
          ),
          BlocListener<CounterBloc, int>(
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                ..hideCurrentMaterialBanner()
                ..showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Success'),
                  ),
                );
            },
            child: Container(),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              counterBloc.add(CounterEvent.increment);
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.minimize),
            onPressed: () {
              counterBloc.add(CounterEvent.decrement);
            },
          )
        ],
      ),
    );
  }
}
