import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

// ignore: must_be_immutable
class ExtentionMethod extends StatelessWidget {
  ExtentionMethod({super.key});

  //CounterBlock myCounter = CounterBlock(initialData: 0);

  @override
  Widget build(BuildContext context) {
    //CounterBlock myExtention = context.read<CounterBlock>();
    CounterBlock myExtention = context.watch<CounterBlock>();
    //CounterBlock myExtention = context.select<CounterBlock>();
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
              child: Text(
                "${myExtention.state}",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.green.shade600,
                ),
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
                  myExtention.remove();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myExtention.add();
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
