import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/bloc/counter_events.dart';
import 'package:counter_bloc/bloc/counter_state.dart';
import 'package:counter_bloc/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with bloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<CounterBloc>(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.counter.toString(),
                  style: const TextStyle(fontSize: 60, color: Colors.cyan)),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(Increment());
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    width: 34.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(Decrement());
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SecondPage();
                  }));
                },
                child: const Text(
                  'Second Page',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
