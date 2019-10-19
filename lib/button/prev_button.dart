import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:callsystem/model.dart';
import 'package:callsystem/header/header_title.dart';
import 'package:callsystem/button/button_container.dart';
import 'package:callsystem/button/number_button.dart';
import 'package:callsystem/button/clear_button.dart';
import 'package:callsystem/page/inputpeoples/input_peoples.dart';

import 'package:callsystem/redux/actions.dart';

import 'dart:async';

class PrevButton extends StatefulWidget {
  final buttonColor;
  final buttonTextColor;
  final onPressed;

  PrevButton({
    this.buttonColor,
    this.buttonTextColor,
    this.onPressed,
  });

  @override
  _PrevButtonState createState() => _PrevButtonState();
}

class _PrevButtonState extends State<PrevButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 65.0,
      child: RaisedButton(
        child: Icon(
          Icons.arrow_back,
          color: widget.buttonTextColor,
          size: 35.0,
        ),
        elevation: 10.0,
        color: widget.buttonColor,
        shape: CircleBorder(
          side: BorderSide(
            color: Color(0xFFc3c3c3),
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        onPressed: () => widget.onPressed(),
      )
    );
  }
}