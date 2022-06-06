import 'package:bloc_pattern/home_page/home_page_bloc.dart';
import 'package:bloc_pattern/model/features_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Examples')),
      body: Center(
        child: BlocBuilder<HomePageBloc, List<Features>>(
          bloc: context.read<HomePageBloc>().fetchData(),
          builder: (context, state) {
            if (state.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(state[index].title),
                    subtitle: Text(state[index].body),
                  );
                },
                itemCount: state.length,
              );
            } else {
              return const CircularProgressIndicator(
                color: Colors.greenAccent,
              );
            }
          },
        ),
      ),
    );
  }
}
