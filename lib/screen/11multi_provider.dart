import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';
import 'package:latihan_bloc/bloc/theme.dart';

// ignore: must_be_immutable
class MultiProvider extends StatelessWidget {
  const MultiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter = context.read<CounterBlock>();
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            myTheme.changeTheme();
          },
          child: const Icon(Icons.square)),
      appBar: AppBar(
        title: const Text('Multi Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade50,
              ),
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<CounterBlock, int>(
                bloc: myCounter,
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.green.shade600,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.remove();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.add();
                },
                icon: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
