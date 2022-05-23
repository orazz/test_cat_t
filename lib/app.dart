import 'package:cat_t/facts/bloc/fact_bloc.dart';
import 'package:cat_t/facts/fact/fact.dart';
import 'package:cat_t/facts/fact_list/fact_list.dart';
import 'package:cat_t/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final ApiClient client;
  const App({Key? key, required this.client}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactBloc(client: client)..add(InitFactEvent()),
      child: MaterialApp(
        home: Fact(client: client),
        routes: {
          '/home': (context) => Fact(client: client),
          '/fact_history': ((context) => const FactList())
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
