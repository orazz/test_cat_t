import 'package:cat_t/helpers/api_const.dart';
import 'package:cat_t/models/fact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/fact.dart';
import '../../services/api.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final ApiClient client;
  Fact? fact;
  String? imageUrl;
  String? hasError;
  Box? facts;

  FactBloc({required this.client}) : super(FactInit()) {
    on<InitFactEvent>(_onStarted);
    on<LoadFactEvent>(_onFetchFact);
  }

  void _onStarted(event, emit) async {
    facts = await Hive.openBox<Fact>('facts');
    add(LoadFactEvent());
    try {
      final item = await client.fetchFact();
      final image = await client.fetchImage();
      fact = item;
      imageUrl = "${ApiConst.cImageUrl}${image.url}";
      emit(FactLoaded());
    } catch (_) {
      emit(FactError());
    }
  }

  void _onFetchFact(event, emit) async {
    emit((FactInit()));
    try {
      final item = await client.fetchFact();
      final image = await client.fetchImage();
      fact = item;
      imageUrl = "${ApiConst.cImageUrl}${image.url}";
      facts!.add(fact);
      emit(FactLoaded());
    } catch (error) {
      hasError = error.toString();
      emit(FactError());
    }
  }
}
