import 'package:bloc_tutorial/state/counter_state.dart';
import 'package:bloc_tutorial/state_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = StateObserver();
  runApp(MaterialApp(
    home: BlocProvider(
      create: (_) => CounterState(),
      child: Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.read<CounterState>().increament(),
              child: Text('click'),
            ),
            BlocBuilder<CounterState, int>(
              builder: (context, state) => Text(state.toString()),
              buildWhen: (previousState, newState) => newState > 10,
            ),
            //Series Part 2
            BlocListener(
              listener: (context, state) {
                print('BlocListener $state');
              },
              child: BlocBuilder<CounterState, int>(
              builder: (context, state) => Text(state.toString()),
            ),
              bloc: context.read<CounterState>(),
              //bloc: BlocProvider.of<CounterState>(context),
              listenWhen: (int previousState, int newState) => newState > 5,
            )
          ],
        ),
      ),
    );
  }
}
