import 'package:bloc_pattern/counter_bloc/counter_bloc.dart';
import 'package:bloc_pattern/custom_bloc_event/custom_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomBloc>(context).add(MyList("Wow"));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                BlocBuilder<CustomBloc, CustomState>(builder: (context, state) {
              if (state is InitState) {
                return Text(
                  "Init state",
                  style: TextStyle(fontSize: 27),
                );
              }

              if (state is LoadingState) {
                return CircularProgressIndicator(
                  color: Colors.greenAccent,
                );
              }

              if (state is CompletedState) {
                return Text(
                  state.myDate,
                  style: TextStyle(fontSize: 27),
                );
              }

              return Container();
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
    );
  }
}
