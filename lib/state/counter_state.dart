import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState extends Cubit<int> {
  CounterState() : super(0);

  void increament() => emit(state + 1);
}
