import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

// ignore: must_be_immutable
class BlocBuilderCls extends StatelessWidget {
  BlocBuilderCls({super.key});

  CounterBlock myCounter = CounterBlock(initialData: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
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
                buildWhen: (previous, current) {
                  if (current % 2 == 1) {
                    return true;
                  } else {
                    return false;
                  }
                },
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
