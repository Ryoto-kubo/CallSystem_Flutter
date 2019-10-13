import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:callsystem/home/home_view.dart';


class HeaderTitle extends StatelessWidget {
  final String headerTitle; //受け取る変数の定義

  HeaderTitle({this.headerTitle}); //受け取る値を上記の変数に代入

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(size);
    return  Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 50.0),
              child: Text(
                '$headerTitle',
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
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
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
                  left: -1130.0,
                  duration: Duration(milliseconds: 100),
                  width: 1130.0,
                  height: 15.0,
                  child: Container(
                    color: Color(0xFF00ffff),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}