import 'package:flutter/material.dart';
import 'package:callsystem/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: HomeView(),
        )
      ),
    );
  }
}

