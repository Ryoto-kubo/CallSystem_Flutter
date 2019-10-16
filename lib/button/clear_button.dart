import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_redux/flutter_redux.dart';


import 'package:callsystem/inputpeoples/input_peoples.dart';

import 'package:callsystem/model.dart';
import 'package:callsystem/redux/reducers.dart';
import 'package:callsystem/redux/actions.dart';

import 'dart:async';

class _ViewModel {
  String inputNum;
  bool isButtonMove;
  final onAddInputNum;
  final onClearInputNum; 

  _ViewModel({
    this.inputNum,
    this.isButtonMove,
    this.onAddInputNum,
    this.onClearInputNum,
  });
}

class ClearButton extends StatefulWidget {

  // 変数の定義
  final number;
  final buttonWidth;
  final buttonHeight;
  final buttonDiseableColor;
  final buttonNumberTextColor;
  final isButtonNumberDisabled;
  final isButtonMove;
  final onPressed;

    // 引数の受け取り
  ClearButton({
    this.number,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonDiseableColor,
    this.buttonNumberTextColor,
    this.isButtonNumberDisabled,
    this.isButtonMove,
    this.onPressed
  });

  @override
  _ClearButtonState createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  double top;

    void buttonDown() {
    setState(() {
      top = 5.0;
      widget.onPressed();
      Timer(
        Duration(
          milliseconds: 300,
        ), () {
        buttonUp();
      });
    });
  }

  void buttonUp() {
    setState(() {
      top = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {

    double cotainerHeight = widget.buttonHeight + 10;

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
        return Stack(
          children: <Widget>[
            Container(
              width: widget.buttonWidth,
              height: cotainerHeight
            ),
            Positioned(
              top: 10.0,
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF898989),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            AnimatedPositioned(
              top: top,
              duration: Duration(milliseconds: 100),
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFc3c3c3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FlatButton(
                  color: widget.buttonDiseableColor,
                  child: Text(
                    '${widget.number}',
                    style: TextStyle(
                      color: widget.buttonNumberTextColor,
                      fontSize: 40.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  onPressed: () => widget.isButtonNumberDisabled ? buttonDown() : null,
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}