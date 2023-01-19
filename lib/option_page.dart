import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/theme.dart';
import 'package:latihan_bloc/bloc/user_bloc.dart';
import 'package:latihan_bloc/routes.dart';
import 'package:latihan_bloc/screen/11multi_provider.dart';
import 'package:latihan_bloc/screen/12multi_listener.dart';
import 'package:latihan_bloc/screen/13bloc_selector.dart';
import 'package:latihan_bloc/screen/14ectention_method.dart';

import 'package:latihan_bloc/screen/1stream.dart';
import 'package:latihan_bloc/screen/2basic_cubit.dart';
import 'package:latihan_bloc/screen/3observer_cubit.dart';
import 'package:latihan_bloc/screen/4bloc.dart';
import 'package:latihan_bloc/screen/5bloc_listener.dart';
import 'package:latihan_bloc/screen/6bloc_consumer.dart';
import 'package:latihan_bloc/screen/7bloc_provider.dart';
import 'package:latihan_bloc/screen/8depedancy_injection.dart';
import 'package:latihan_bloc/screen/9bloc_provider_value.dart';

import 'bloc/counter_block.dart';

// ignore: must_be_immutable
class OptionPage extends StatelessWidget {
  OptionPage(this.option, {super.key});
  int option;
  final router = MyRoute();
  final ThemeBloc myTheme = ThemeBloc();
  final CounterBlock myCounter = CounterBlock();
  @override
  Widget build(BuildContext context) {
    switch (option) {
      case 1:
        return const MaterialApp(
          home: Stream1(),
        );
      case 2:
        return const MaterialApp(
          home: BasicCubit(),
        );
      case 3:
        return const MaterialApp(
          home: ObserverCubit(),
        );
      case 4:
        return MaterialApp(
          home: BlocBuilderCls(),
        );
      case 5:
        return MaterialApp(
          home: BlocListenerCls(),
        );
      case 6:
        return MaterialApp(
          home: BlocConsumerCls(),
        );
      case 7:
        return MaterialApp(
            home: BlocProvider(
          create: (context) {
            return CounterBlock();
          },
          child: const BlocProviderCls(),
        ));
      case 8:
        return MaterialApp(
            home: BlocProvider(
          create: (context) {
            return CounterBlock();
          },
          child: const DepedancyInjection(),
        ));
      case 9:
        return MaterialApp(
            home: BlocProvider(
          create: (context) {
            return CounterBlock();
          },
          child: const BlocProviderValue(),
        ));
      case 10:
        return MaterialApp(
          onGenerateRoute: router.onGenerateRoute,
        );
      case 11:
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => myTheme),
            BlocProvider(create: (context) => myCounter),
          ],
          child: BlocBuilder<ThemeBloc, bool>(
            bloc: myTheme,
            builder: (context, state) {
              return MaterialApp(
                theme: state == true ? ThemeData.light() : ThemeData.dark(),
                home: const MultiProvider(),
              );
            },
          ),
        );
      case 12:
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => myTheme),
            BlocProvider(create: (context) => myCounter),
          ],
          child: BlocBuilder<ThemeBloc, bool>(
            bloc: myTheme,
            builder: (context, state) {
              return MaterialApp(
                theme: state == true ? ThemeData.light() : ThemeData.dark(),
                home: const Multilistener(),
              );
            },
          ),
        );
      // code di bawah ini merupakan code no 11 awal sebelum diganti, agar terlihat
      //lebih rapih jika menggunakan multiprovider
      /*return BlocProvider(
          create: (context) => myTheme,
          child: BlocBuilder<ThemeBloc, bool>(
            bloc: myTheme,
            builder: (context, state) {
              return MaterialApp(
                theme: state == true ? ThemeData.light() : ThemeData.dark(),
                home: BlocProvider(
                  create: (context) => CounterBlock(),
                  child: const MultiProvider(),
                ),
              );
            },
          ),
        );*/
      case 13:
        return MaterialApp(
          home: BlocProvider(
            create: (context) => UserBloc(),
            child: const Selector(),
          ),
        );
      case 14:
        return MaterialApp(
          home: BlocProvider(
            create: (context) => CounterBlock(),
            child: ExtentionMethod(),
          ),
        );
      default:
        return Container();
    }
  }
}
