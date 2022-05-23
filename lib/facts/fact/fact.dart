import 'dart:io';

import 'package:cat_t/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/api.dart';
import '../bloc/fact_bloc.dart';

part "fact_body.dart";

class Fact extends StatelessWidget {
  const Fact({required this.client, Key? key}) : super(key: key);
  final ApiClient client;

  @override
  Widget build(BuildContext context) {
    FactBloc factBloc = BlocProvider.of<FactBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat Trivia"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 251, 250, 250),
      body: FactBody(factBloc: factBloc),
    );
  }
}
