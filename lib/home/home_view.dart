import 'package:flutter/material.dart';
import 'package:callsystem/inputpeoples/input_peoples.dart';
import 'dart:async';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  double top = 0;

  void buttonPush(){
    top = 5.0;
  }

  void buttonUp(){
    top = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset('images/people.png'),
                  width: 300.0,
                  height: 300.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 80.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '現在の待ち組数',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Color(0xFF232323)
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 30.0),
                            child: Text(
                              '3',
                              style: TextStyle(
                                fontSize: 180.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3163ED)
                              )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 120.0, left: 30.0),
                            child: Text(
                              '名',
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Color(0xFF232323)
                              ),
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 660.0,
                      height: 130.0,
                    ),
                    Positioned(
                      top: 10,
                      width: 660.0,
                      height: 120.0,
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Color(0xFF008B8B),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: top,
                      width: 660.0,
                      height: 120.0,
                      duration: Duration(milliseconds: 500),
                      child: FlatButton(
                        color: Color(0xFF53C9C5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Container(
                          child: Text(
                            '受付へすすむ',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Color(0xFFFFFFFF)
                            ),  
                          )
                        ),
                        onPressed: (){
                          setState(() {
                            buttonPush();
                            Timer(Duration(milliseconds: 500), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InputPeoples()),
                              );
                              buttonUp();
                            });
                          });
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 1000.0,
                  child: Divider(
                    color: Colors.grey[800]
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '現在呼び出し中の番号はこちらの番号です',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Color(0xFF232323)
                    )
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3163ED)
                    )
                  ),
                ),
              ],
            )
          ]
        )
      ),
    );
  }
}