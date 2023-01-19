import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

class DepedancyInjection extends StatelessWidget {
  const DepedancyInjection({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter = BlocProvider.of<CounterBlock>(context);
    //CounterBlock myCounter = context.read<CounterBlock>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Depedancy Injection"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialWidget2(
                imgIcon: Icons.remove,
                press: () => myCounter.remove(),
              ),
              const DataWidgetMerah2(),
              MaterialWidget2(
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

class MaterialWidget2 extends StatelessWidget {
  const MaterialWidget2({
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

class DataWidgetMerah2 extends StatelessWidget {
  const DataWidgetMerah2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetKuning2(),
    );
  }
}

class DataWidgetKuning2 extends StatelessWidget {
  const DataWidgetKuning2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetBiru2(),
    );
  }
}

class DataWidgetBiru2 extends StatelessWidget {
  const DataWidgetBiru2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetCenter2(),
    );
  }
}

class DataWidgetCenter2 extends StatelessWidget {
  const DataWidgetCenter2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DataWidget2(),
    );
  }
}

class DataWidget2 extends StatelessWidget {
  const DataWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //penggunaan pemanggilan context sama
    //CounterBlock myCounter = BlocProvider.of<CounterBlock>(context);
    CounterBlock myCounter = context.read<CounterBlock>();

    return BlocBuilder(
      bloc: myCounter,
      builder: (context, state) {
        return Text(
          "$state",
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
