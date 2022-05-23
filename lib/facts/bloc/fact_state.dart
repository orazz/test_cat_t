part of 'fact_bloc.dart';

@immutable
abstract class FactState {}

class FactInit extends FactState {}

class FactLoaded extends FactState {}

class FactError extends FactState {}
