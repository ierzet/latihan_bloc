import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

// ignore: must_be_immutable
class BlocConsumerCls extends StatelessWidget {
  BlocConsumerCls({super.key});

  CounterBlock myCounter = CounterBlock(initialData: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Consumer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade50,
                border: Border.all(
                    color: Colors.red.shade200,
                    width: 5.0,
                    style: BorderStyle.solid),
              ),
              padding: const EdgeInsets.all(16),
              child: BlocConsumer<CounterBlock, int>(
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
                listener: ((context, state) =>
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text("$state"),
                      ),
                    )),
                buildWhen: (previous, current) {
                  if (current % 2 == 0) {
                    return true;
                  } else {
                    return false;
                  }
                },
                listenWhen: (previous, current) {
                  if (current % 2 == 1) {
                    return true;
                  } else {
                    return false;
                  }
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
