import 'dart:io';

import 'package:cat_t/facts/bloc/fact_bloc.dart';
import 'package:cat_t/models/fact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/helpers.dart';
part 'fact_list_body.dart';

class FactList extends StatelessWidget {
  const FactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 251, 250, 250),
      body: const FactListBody(),
    );
  }
}
