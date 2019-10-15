import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:callsystem/model.dart';
import 'package:callsystem/home/home_view.dart';
import 'package:callsystem/redux/reducers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final Store store = Store<InputNumState>(
    inputNumReducer,
    initialState: InputNumState.initialState()
  );
  
  @override
  Widget build(BuildContext context) {
    return StoreProvider<InputNumState>(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFFF4F4F4),
          body: SafeArea(
            child: HomeView(),
          )
        ),
      ),
    );
  }
}

