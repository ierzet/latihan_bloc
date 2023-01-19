import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

class BlocProviderValue extends StatelessWidget {
  const BlocProviderValue({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter = BlocProvider.of<CounterBlock>(context);
    //CounterBlock myCounter = context.read<CounterBlock>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Value"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              // blocprovider.value digunakan bila sudah ada blocprovider
              //sebelumnya, yang berfungsi untuk meneruskan nilai bloc sebelumnya
              builder: (context) => BlocProvider.value(
                value: myCounter,
                child: const OtherPage(),
              ),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialWidget3(
                imgIcon: Icons.remove,
                press: () => myCounter.remove(),
              ),
              const DataWidgetMerah3(),
              MaterialWidget3(
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

class MaterialWidget3 extends StatelessWidget {
  const MaterialWidget3({
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

class DataWidgetMerah3 extends StatelessWidget {
  const DataWidgetMerah3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetKuning3(),
    );
  }
}

class DataWidgetKuning3 extends StatelessWidget {
  const DataWidgetKuning3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetBiru3(),
    );
  }
}

class DataWidgetBiru3 extends StatelessWidget {
  const DataWidgetBiru3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetCenter3(),
    );
  }
}

class DataWidgetCenter3 extends StatelessWidget {
  const DataWidgetCenter3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DataWidget3(),
    );
  }
}

class DataWidget3 extends StatelessWidget {
  const DataWidget3({
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

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter = context.read<CounterBlock>();
    return Scaffold(
      appBar: AppBar(title: const Text("Other Page")),
      body: Center(
          child: BlocBuilder(
        bloc: myCounter,
        builder: (context, state) {
          return Text(
            "$state",
            style: const TextStyle(
              fontSize: 50,
            ),
          );
        },
      )),
    );
  }
}
