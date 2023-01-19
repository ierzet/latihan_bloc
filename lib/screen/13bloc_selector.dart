import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/user_bloc.dart';

class Selector extends StatelessWidget {
  const Selector({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc myUser = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Selector"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocSelector<UserBloc, Map<String, dynamic>, String>(
                selector: (state) => state['name'],
                builder: (context, state) {
                  return Text(
                    "Nama : $state",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            Center(
              child: BlocSelector<UserBloc, Map<String, dynamic>, int>(
                selector: (state) => state['age'],
                builder: (context, state) {
                  return Text(
                    "Nama : $state ",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myUser.changeAge(myUser.state["age"] - 1);
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                  onPressed: () {
                    myUser.changeAge(myUser.state["age"] + 1);
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              autocorrect: false,
              onChanged: (value) => myUser.changeName(value),
              style: const TextStyle(fontSize: 25),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
