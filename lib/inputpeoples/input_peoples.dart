import 'package:flutter/material.dart';
import 'package:callsystem/home/home_view.dart';

class InputPeoples extends StatefulWidget {
  @override
  _InputPeoplesState createState() => _InputPeoplesState();
}

class _InputPeoplesState extends State<InputPeoples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 50.0),
                  child: Text(
                    '人数を入力してください',
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
              ],
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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 300.0,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}

