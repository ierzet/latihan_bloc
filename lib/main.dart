import 'package:flutter/material.dart';
import 'package:latihan_bloc/option_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //input disini(option: 1-14)
  final int option = 11;

  @override
  Widget build(BuildContext context) {
    return OptionPage(option);
  }
}
