import 'package:flutter/material.dart';
import 'package:callsystem/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        body: SafeArea(
          child: HomeView(),
        )
      ),
    );
  }
}

