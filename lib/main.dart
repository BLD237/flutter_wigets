import 'package:flutter/material.dart';
import 'package:childwiget/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Wigets',
      home: MyHomePage(),
    );
  }
}
//day 12 0f 30 days coding challenge

