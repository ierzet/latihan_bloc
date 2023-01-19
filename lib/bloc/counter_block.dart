import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlock extends Cubit<int> {
  CounterBlock({this.initialData = 0}) : super(initialData);
  int initialData;
  int next = 0;
  int current = 0;

  add() => emit(state + 1);

  remove() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
