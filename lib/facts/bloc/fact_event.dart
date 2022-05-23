part of 'fact_bloc.dart';

@immutable
abstract class FactEvent {}

class InitFactEvent extends FactEvent {}

class LoadFactEvent extends FactEvent {}
