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

class InputPeoples extends StatefulWidget {
  @override
  _InputPeoplesState createState() => _InputPeoplesState();
}

class _InputPeoplesState extends State<InputPeoples> {

  // Class ButtonContainer
  String buttonText;
  Color  buttonTextColor;
  Color  buttonColor;
  Color  buttonBackColor;
  double width  = 250.0;
  double height = 90.0;
  double top;
  bool   isDisabled;

  // Class NumberButton 変数
  double buttonNumberWidth = 340;
  double buttonWidth       = 100.0;
  double buttonHeight      = 100.0;
  double clearButtonWidth  = 220.0;
  Color  buttonDiseableColor;
  Color  buttonNumberTextColor;
  bool   isButtonNumberDisabled;
  bool   isButtonMove = false;

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
        // _initialValueが入力されてるかどうか
        if(viewModel.inputNum == '' || viewModel.inputNum.length > 2){
          buttonText      = '';
          buttonTextColor = Color(0xFFFFFFFF);
          buttonColor     = Color(0xFFF08080);
          buttonBackColor = Color(0xFF8B0000);
          top             = 5.0;
          isDisabled      = false;
        } else {
          // _initialValueが2桁以上になればbutton desableにする
          buttonText      = '次へ';
          buttonTextColor = Color(0xFFFFFFFF);
          buttonColor     = Color(0xFF53C9C5);
          buttonBackColor = Color(0xFF008B8B);
          top             = 0.0;
          isDisabled      = true;
        }

        if (viewModel.inputNum == '' || viewModel.inputNum.length <= 1) {
          buttonDiseableColor = Color(0xFFF7F7F7);
          buttonNumberTextColor = Color(0xFF686868);
          isButtonNumberDisabled = true;
        } else if (viewModel.inputNum.length == 2) {
          buttonDiseableColor = Color(0xFFDCDCDC);
          buttonNumberTextColor = Color(0xFF808080);
          isButtonNumberDisabled = false;
        }

        return Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          body: Column(
            children: <Widget>[
              SafeArea(
                child: HeaderTitle(headerTitle: '人数を入力してください'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InputFeild(),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        width: buttonNumberWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            NumberButton(
                              number: 1,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('1', false, 1),// 変数onPressedにaddNumber()メソッドを格納
                            ),
                            NumberButton(
                              number: 2,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('2', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                            NumberButton(
                              number: 3,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('3', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        width: buttonNumberWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            NumberButton(
                              number: 4,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('4', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                            NumberButton(
                              number: 5,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('5', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                            NumberButton(
                              number: 6,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('6', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        width: buttonNumberWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            NumberButton(
                              number: 7,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('7', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                            NumberButton(
                              number: 8,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('8', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                            NumberButton(
                              number: 9,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('9', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソ, false, 1ッドを格納
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        width: buttonNumberWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            NumberButton(
                              number: 0,
                              buttonWidth: buttonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: buttonDiseableColor,
                              buttonNumberTextColor: buttonNumberTextColor,
                              isButtonNumberDisabled: isButtonNumberDisabled,
                              isButtonMove: isButtonMove,
                              onPressed: () => viewModel.onAddInputNum('0', false, 1) // 変数onPressedにviewModel.onAddInputNum()メソッドを格納
                            ),
                            ClearButton(
                              number: 'クリア',
                              buttonWidth: clearButtonWidth,
                              buttonHeight: buttonHeight,
                              buttonDiseableColor: Color(0xFFF7F7F7),
                              buttonNumberTextColor: Color(0xFF686868),
                              isButtonNumberDisabled: true,
                              isButtonMove: false,
                              onPressed: () => viewModel.onClearInputNum(true, 0) // 変数onPressedにclear()メソッドを格納
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: ButtonContainer(
                      buttonText:      buttonText,
                      buttonTextColor: buttonTextColor,
                      buttonColor:     buttonColor,
                      buttonBackColor: buttonBackColor,
                      buttonWidth:     width,
                      buttonHeight:    height,
                      topPosition:     top,
                      isDisabled:      isDisabled,
                    ),
                  )
                ],
              )
            ],
          )
        );
      }
    );
  }
}

class InputFeild extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => new _ViewModel(
        inputNum: store.state.inputNum,
      ),
      builder: (context, viewModel) => Row(
        children: <Widget>[
          Container(
            width: 300.0,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(20.0)),
              border: Border(
                top: BorderSide(width: 6.0, color: Color(0xFF686868)),
                left: BorderSide(width: 6.0, color: Color(0xFF686868)),
                right: BorderSide(width: 6.0, color: Color(0xFF686868)),
                bottom: BorderSide(width: 6.0, color: Color(0xFF686868)),
              )
            ),
            child: TextFormField(
              controller: TextEditingController(
                text: viewModel.inputNum,
              ),
              textAlign:TextAlign.center,
              readOnly: true,
              style: TextStyle(
                fontSize: 60.0,
                color: Color(0xFF686868)
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 30.0),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 110.0, left: 20.0),
            child: Text(
              '名様',
              style: TextStyle(
                fontSize: 40.0,
                color: Color(0xFF686868)
              )
            ),
          )
        ],
      ),
    );
  }
}