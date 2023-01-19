import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';
import 'package:latihan_bloc/bloc/theme.dart';

// ignore: must_be_immutable
class Multilistener extends StatelessWidget {
  const Multilistener({super.key});

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
              child: MultiBlocListener(
                child: const BuilderCounter(),
                listeners: [
                  BlocListener<CounterBlock, int>(
                    bloc: context.read<CounterBlock>(),
                    listener: (context, state) =>
                        ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("$state"),
                        duration: const Duration(
                          seconds: 1,
                        ),
                      ),
                    ),
                    listenWhen: (previous, current) {
                      if (current % 2 == 1) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                  ),
                  BlocListener<ThemeBloc, bool>(
                    listener: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Dark"),
                          duration: Duration(
                            seconds: 1,
                          ),
                        ),
                      );
                      // TODO: implement listener
                    },
                    listenWhen: (previous, current) {
                      if (current == false) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                  ),
                ],
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

class ListenTheme extends StatelessWidget {
  const ListenTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeBloc, bool>(
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("tema"),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
        // TODO: implement listener
      },
      listenWhen: (previous, current) {
        if (current == false) {
          return true;
        } else {
          return false;
        }
      },
      child: const ListenCounter(),
    );
  }
}

class ListenCounter extends StatelessWidget {
  const ListenCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBlock, int>(
      bloc: context.read<CounterBlock>(),
      listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$state"),
          duration: const Duration(
            seconds: 1,
          ),
        ),
      ),
      listenWhen: (previous, current) {
        if (current % 2 == 1) {
          return true;
        } else {
          return false;
        }
      },
    );
  }
}

class BuilderCounter extends StatelessWidget {
  const BuilderCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBlock, int>(
      bloc: context.read<CounterBlock>(),
      builder: (context, state) {
        return Text(
          "$state",
          style: TextStyle(
            fontSize: 50,
            color: Colors.green.shade600,
          ),
        );
      },
    );
  }
}
