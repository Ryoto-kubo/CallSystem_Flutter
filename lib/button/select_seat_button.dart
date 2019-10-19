import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:callsystem/model.dart';
import 'package:callsystem/redux/actions.dart';
import 'package:callsystem/redux/reducers.dart';

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

class SelectSeatButton extends StatefulWidget {

  final buttonText;
  final buttonWidth;
  final buttonHeight;
  final buttonColor;
  final buttonTextColor;

  SelectSeatButton({
    this.buttonText,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    this.buttonTextColor,
  });

  @override
  _SelectSeatButtonState createState() => _SelectSeatButtonState();
}

class _SelectSeatButtonState extends State<SelectSeatButton> {

  double top = 0.0;

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
              height: cotainerHeight,
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
                  color: widget.buttonColor,
                  child: Text(
                    '${widget.buttonText}',
                    style: TextStyle(
                      color: widget.buttonTextColor,
                      fontSize: 35.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  onPressed: (){
                  }
                  // onPressed: () => widget.isButtonNumberDisabled ? buttonDown() : null,
                ),
              ),

            )
          ],
        );
      }
    );
  }
}