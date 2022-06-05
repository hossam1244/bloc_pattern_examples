import 'package:bloc_pattern/counter_bloc/counter_bloc.dart';
import 'package:bloc_pattern/counter_bloc/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefactorCounterPage extends StatelessWidget {
  const RefactorCounterPage({Key? key}) : super(key: key);

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
          BlocConsumer<CounterBloc, int>(
            builder: (context, state) {
              return Center(
                  child: Text('you have pushed the button $state times'));
            },
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
          ),
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
