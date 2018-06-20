import 'package:flutter/material.dart';
import 'booklist.dart';
import 'package:share/share.dart';
import 'sjtu_login.dart';
import 'storage.dart';
import 'dart:async';
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new BottomNavigationInst(),
    );
  }
}

class  BottomNavigationInst extends StatefulWidget {
  @override
  _BottomNavigationState createState() => new _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationInst>
{

  int _currentIndex = 0;
  var titles = const ["信息交流","查看教材","排队领书"];
  Widget build(BuildContext context) {
  return new Scaffold(
    appBar: AppBar(title: new Text(titles[_currentIndex])),
    body: new Stack(
      children: <Widget>[
        new Offstage(
          offstage: _currentIndex != 0,
          child: new TickerMode(
            enabled: _currentIndex == 0,
            child: new MaterialApp(home: new Scaffold(body: new Text("1")),)
          ),
        ),
        new Offstage(
          offstage: _currentIndex != 1,
          child: new TickerMode(
            enabled: _currentIndex == 1,
            child: new MaterialApp(home: Booklist(),)
          ),
        ),
        new Offstage(
          offstage: _currentIndex != 2,
          child: new TickerMode(
            enabled: _currentIndex == 2,
            child: new MaterialApp(home:new Scaffold(body:  new Text("3")),)
          ),
        ),
      ],
    ),
    bottomNavigationBar: new BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) { 
        setState((){ this._currentIndex = index; }); 
        },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text("Left"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          title: new Text("Right"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.cached),
          title: new Text("3"),
        ),
      ],
    ),
    drawer: new DrawerPage(),
    );
  }
}

class DrawerPage extends StatefulWidget {
  @override
  DrawerInst createState() => new DrawerInst();
}


class  DrawerInst extends State<DrawerPage> {
  @override
  String ClassNum;
  Widget build(BuildContext context)  {
   
    return new Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: new ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new FutureBuilder<Storage>(
                future: fetchStorage(),
                builder: (context,snapshot){
                  if (snapshot.hasData) {
                    return new Text(snapshot.data.classnum);
                  } else if (snapshot.hasError) {
                    return new Text("${snapshot.error}");
                  }
                },
                ),
              // child: new Text(Storage.classnum),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: new Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                // setClassnum("F1603022");
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context){
                      return new MaterialApp(
                        home:LoginPage()
                      );
                    }
                  )
                );
              },
            ),
            new ListTile(
              title: new Text('分享选书链接'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Share.share('请选择教材 https://example.com');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}