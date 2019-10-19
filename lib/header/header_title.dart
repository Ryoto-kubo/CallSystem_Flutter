import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:callsystem/home/home_view.dart';
import 'package:callsystem/page/inputpeoples/input_peoples.dart';
import 'package:callsystem/model.dart';
import 'package:callsystem/redux/actions.dart';
import 'dart:async';

class _ViewModel {
  String inputNum;
  final currentPage;
  final onPrevHomePage;

  _ViewModel({
    this.inputNum,
    this.currentPage,
    this.onPrevHomePage
  });
}

class HeaderTitle extends StatefulWidget {
  final String headerTitle; //受け取る変数の定義

  HeaderTitle({
    this.headerTitle
  }); //受け取る値を上記の変数に代入

  @override
  _HeaderTitleState createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  final double defaultNum = -1130.0;
  double progressBarPosition = -1130.0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel(
        inputNum: store.state.inputNum,
        currentPage: store.state.currentPage,
        onPrevHomePage: () => store.dispatch(PrevHomePage()),
      ),
      builder: (context, viewModel) {
        double moveStepInt = defaultNum / 4;
        if (viewModel.currentPage == 0) {
          progressBarPosition = defaultNum;
        }
        if (viewModel.inputNum.length == 1) {
          progressBarPosition = progressBarPosition - moveStepInt;
        }
        return  Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 50.0),
                  child: Text(
                    '${widget.headerTitle}',
                    style: TextStyle(
                      fontSize: 32.0,
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 50.0),
                  child: FlatButton(
                    child: Image.asset(
                      'images/icon/home.png',
                        width: 60.0,
                        height: 60.0,
                      ),
                    onPressed: (){
                      viewModel.onPrevHomePage();
                        Navigator.popUntil(context,ModalRoute.withName('/'));
                    },
                  )
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 1130.0,
                      height: 15.0,
                      color: Color(0xFF808080),
                    ),
                    AnimatedPositioned(
                      top: 0,
                      left: progressBarPosition,
                      duration: Duration(milliseconds: 300),
                      width: 1130.0,
                      height: 15.0,
                      child: Container(
                        decoration:BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF1E90FF),
                              Color(0xFF53C9C5),
                            ],
                          )
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        );
      }
    );
  }
}