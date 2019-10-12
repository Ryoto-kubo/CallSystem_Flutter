import 'package:flutter/material.dart';
import 'package:callsystem/home/home_view.dart';


class HeaderTitle extends StatelessWidget {
  final String headerTitle; //受け取る変数の定義

  HeaderTitle({this.headerTitle}); //受け取る値を上記の変数に代入

  @override
  Widget build(BuildContext context) {
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
            Container(
              width: 1300.0,
              child: Divider(
                color: Colors.grey[800]
              ),
            )
          ],
        ),
      ],
    );
  }
}