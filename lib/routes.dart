import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter_block.dart';
import 'package:latihan_bloc/screen/10generated_route_access.dart';

class MyRoute {
  Route onGenerateRoute(RouteSettings settings) {
    final CounterBlock myCounter = CounterBlock();

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: myCounter,
            child: const GeneratedRouteAcces(),
          ),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: myCounter,
            child: const OtherPage2(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Not Found"),
            ),
          ),
        );
    }
  }
}
