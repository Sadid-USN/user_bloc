import 'package:counter_bloc/bloc/counter_events.dart';
import 'package:counter_bloc/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(const InitialState()) {
    on<Increment>(
      (event, emit) {
        emit(CounterState(counter: state.counter + 1));
      },
    );
    on<Decrement>(
      (event, emit) {
        emit(CounterState(counter: state.counter - 1));
      },
    );
  }
}
