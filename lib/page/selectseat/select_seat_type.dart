import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:callsystem/model.dart';
import 'package:callsystem/header/header_title.dart';
import 'package:callsystem/button/select_seat_button.dart';
import 'package:callsystem/button/prev_button.dart';
import 'package:callsystem/page/inputpeoples/input_peoples.dart';
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

  double buttonWidth     = 300.0;
  double buttonHeight    = 180.0;
  Color  buttonColor     = Color(0xFFF7F7F7);
  Color  buttonTextColor = Color(0xFF232323);
  // Color  buttonTextColor = Color(0xFF808080);
  bool   isButtonMove    = false;

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
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.only(bottom:100.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SelectSeatButton(
                          buttonText: 'テーブル席',
                          buttonWidth: buttonWidth,
                          buttonHeight: buttonHeight,
                          buttonColor: buttonColor,
                          buttonTextColor: buttonTextColor,
                        ),
                        SelectSeatButton(
                          buttonText: 'ボックス席',
                          buttonWidth: buttonWidth,
                          buttonHeight: buttonHeight,
                          buttonColor: buttonColor,
                          buttonTextColor: buttonTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 800.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SelectSeatButton(
                          buttonText: 'カウンター席',
                          buttonWidth: buttonWidth,
                          buttonHeight: buttonHeight,
                          buttonColor: buttonColor,
                          buttonTextColor: buttonTextColor,
                        ),
                        SelectSeatButton(
                          buttonText: 'どちらでも可',
                          buttonWidth: buttonWidth,
                          buttonHeight: buttonHeight,
                          buttonColor: buttonColor,
                          buttonTextColor: buttonTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 80.0, left: 40.0),
                    child: PrevButton(
                      buttonColor: buttonColor,
                      buttonTextColor: buttonTextColor,
                      onPressed: () => 
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => InputPeoples()),
                      ),
                    )
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
