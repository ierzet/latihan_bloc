import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

class ObserverCubit extends StatelessWidget {
  const ObserverCubit({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter2 = CounterBlock(initialData: 20);

    return Scaffold(
      appBar: AppBar(title: const Text("Observer Cubit")),
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
                initialData: myCounter2.initialData,
                stream: myCounter2.stream,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Text(
                        "${snapshot.data}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        "Current : ${myCounter2.current}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        "Next : ${myCounter2.next}",
                        style: const TextStyle(fontSize: 50),
                      ),
                    ],
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
                  myCounter2.remove();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter2.add();
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
