import 'package:flutter/cupertino.dart';

@immutable
class CounterState {
  final int counter;
  const CounterState({required this.counter});
}

class InitialState extends CounterState {
  const InitialState() : super(counter: 0);
}
