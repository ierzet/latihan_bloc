import 'dart:ffi';

import 'package:flutter/material.dart';

class Stream1 extends StatelessWidget {
  const Stream1({super.key});

  Stream<int> countStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    //print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream App"),
      ),
      body: StreamBuilder<Object>(
          stream: countStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'Loading . . .',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("${snapshot.data}",
                    style: const TextStyle(
                      fontSize: 50,
                    )),
              );
            }
          }),
    );
  }
}
