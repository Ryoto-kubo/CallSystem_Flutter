import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:callsystem/model.dart';
import 'package:callsystem/header/header_title.dart';
import 'package:callsystem/button/button_container.dart';
import 'package:callsystem/button/number_button.dart';
import 'package:callsystem/button/clear_button.dart';
import 'package:callsystem/redux/actions.dart';

import 'dart:async';

class _ViewModel {
  String inputNum;
  bool isButtonMove;
  int currentPage;
  final onAddInputNum;
  final onClearInputNum; 

  _ViewModel({
    this.inputNum,
    this.isButtonMove,
    this.currentPage,
    this.onAddInputNum,
    this.onClearInputNum,
  });
}

class SelectSeatType extends StatefulWidget {
  @override
  _SelectSeatTypeState createState() => _SelectSeatTypeState();
}

class _SelectSeatTypeState extends State<SelectSeatType> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel(
        inputNum: store.state.inputNum,
        isButtonMove: store.state.isButtonMove,
        onAddInputNum: (inputNum, isButtonMove, currentPage)
          => store.dispatch(AddInputNum(
            inputNum: inputNum,
            isButtonMove: isButtonMove,
            currentPage: currentPage
          )),
        onClearInputNum: (isButtonMove, currentPage)
          => store.dispatch(ClearInputNum(
            isButtonMove: isButtonMove,
            currentPage: currentPage
          )),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          body: Column(
            children: <Widget>[
              SafeArea(
                child: HeaderTitle(headerTitle: '希望の座席を選択してください'),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        );
      }
    );
  }
}