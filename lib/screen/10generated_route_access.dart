import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';

class GeneratedRouteAcces extends StatelessWidget {
  const GeneratedRouteAcces({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBlock myCounter = BlocProvider.of<CounterBlock>(context);
    //CounterBlock myCounter = context.read<CounterBlock>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generated Route Value"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              // blocprovider.value digunakan bila sudah ada blocprovider
              //sebelumnya, yang berfungsi untuk meneruskan nilai bloc sebelumnya
              builder: (context) => BlocProvider.value(
                value: myCounter,
                child: const OtherPage2(),
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
              MaterialWidget4(
                imgIcon: Icons.remove,
                press: () => myCounter.remove(),
              ),
              const DataWidgetMerah4(),
              MaterialWidget4(
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

class MaterialWidget4 extends StatelessWidget {
  const MaterialWidget4({
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

class DataWidgetMerah4 extends StatelessWidget {
  const DataWidgetMerah4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetKuning4(),
    );
  }
}

class DataWidgetKuning4 extends StatelessWidget {
  const DataWidgetKuning4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetBiru4(),
    );
  }
}

class DataWidgetBiru4 extends StatelessWidget {
  const DataWidgetBiru4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(16),
      child: const DataWidgetCenter4(),
    );
  }
}

class DataWidgetCenter4 extends StatelessWidget {
  const DataWidgetCenter4({
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

class OtherPage2 extends StatelessWidget {
  const OtherPage2({super.key});

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
