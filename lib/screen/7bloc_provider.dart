import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

class BlocProviderCls extends StatelessWidget {
  const BlocProviderCls({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter = BlocProvider.of<CounterBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialWidget(
                imgIcon: Icons.remove,
                press: () => myCounter.remove(),
              ),
              const DataWidget(),
              MaterialWidget(
                imgIcon: Icons.add,
                press: () => myCounter.add(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({
    Key? key,
    required this.imgIcon,
    required this.press,
  }) : super(key: key);

  final IconData imgIcon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: press,
        child: SizedBox(
          height: 60,
          width: 50,
          child: Icon(imgIcon),
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 170,
      color: Colors.amber,
      child: Center(
        child: BlocBuilder<CounterBlock, int>(
          bloc: BlocProvider.of<CounterBlock>(context),
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(
                fontSize: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
