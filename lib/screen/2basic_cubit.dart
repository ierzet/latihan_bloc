import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

class BasicCubit extends StatelessWidget {
  const BasicCubit({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter = CounterBlock(initialData: 0);

    return Scaffold(
      appBar: AppBar(title: const Text("Basic Cubit")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: StreamBuilder(
                initialData: myCounter.initialData,
                stream: myCounter.stream,
                builder: (context, snapshot) {
                  return Text(
                    "${snapshot.data}",
                    style: const TextStyle(fontSize: 50),
                  );
                }),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
