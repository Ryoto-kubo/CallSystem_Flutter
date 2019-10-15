import 'package:flutter/material.dart';
// import 'package:flutter/animation.dart';

import 'package:callsystem/inputpeoples/input_peoples.dart';

// import 'package:callsystem/redux/reducers.dart';
// import 'package:callsystem/redux/actions.dart';
// import 'package:callsystem/store/index.dart';

import 'dart:async';


class ButtonContainer extends StatefulWidget {

  // 変数の定義
  String buttonText;
  Color  buttonTextColor;
  Color  buttonColor;
  Color  buttonBackColor;
  double buttonWidth;
  double buttonHeight;
  double topPosition;
  final  onPressed;
  bool   isDisabled;

  // 引数の受け取り
  ButtonContainer({
    this.buttonText,
    this.buttonTextColor,
    this.buttonColor,
    this.buttonBackColor,
    this.buttonWidth,
    this.buttonHeight,
    this.topPosition,
    this.isDisabled,
    this.onPressed,
  });

  @override
  _ButtonContainerState createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {


  void buttonPush(){
    setState(() {
      widget.topPosition = 5.0;
    });
  }

  void buttonUp(){
    setState(() {
      widget.topPosition = 0;
    });
  }

  void buttonMove(){
    buttonPush();
    Timer(Duration(milliseconds: 200,), () {
      buttonUp();
      Timer(Duration(milliseconds: 400,), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InputPeoples()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    double cotainerHeight = widget.buttonHeight + 10;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: widget.buttonWidth,
              height: cotainerHeight,
            ),
            Positioned(
              top: 10,
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              child: Container(
                decoration: new BoxDecoration(
                  color: widget.buttonBackColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            AnimatedPositioned(
              top: widget.topPosition,
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              duration: Duration(milliseconds: 200),
              child: FlatButton(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  child: Text(
                    '${widget.buttonText}',
                    style: TextStyle(
                      fontSize: 40.0,
                      // color: Color(0xFFFFFFFF),
                      color: widget.buttonTextColor,
                    ),
                  ),
                ),
                onPressed: () => widget.isDisabled ? buttonMove() : null,
              ),
            )
          ],
        )
      ],
    );
  }
}