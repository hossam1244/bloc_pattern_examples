import 'package:bloc_pattern/counter_bloc/refactor_counter_page.dart';
import 'package:bloc_pattern/counter_bloc_cubit/counter_cubit.dart';
import 'package:bloc_pattern/custom_bloc_event/custom_bloc.dart';
import 'package:bloc_pattern/home_page/home_page_bloc.dart';
import 'package:bloc_pattern/shopping_cart_bloc/bloc/catalog_bloc.dart';
import 'package:bloc_pattern/shopping_cart_bloc/repository/shopping_repository.dart';
import 'package:bloc_pattern/shopping_cart_bloc/view/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart/bloc/cart_bloc.dart';
import 'cart/view/cart_page.dart';
import 'counter_bloc/counter_bloc.dart';
import 'counter_bloc/counter_page.dart';
import 'counter_bloc_cubit/counter_view.dart';
import 'custom_bloc_event/view_screen.dart';
import 'home_page/home_page_view.dart';

void main() {
  runApp(MyApp());
}

/**
 *
 * in bloc provider we provide counter bloc to counter page
 */

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final shoppingRepository = ShoppingRepository();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        )
      ],
      child: MaterialApp(
        title: 'Bloc Pattern',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => CatalogPage(),
          '/cart': (_) => CartPage(),
        },
      ),
    );
  }
}
