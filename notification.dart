import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'notificationitem.dart';

class Notifica{
  final String title;
  final String content;

  Notifica({this.title, this.content});

  factory Notifica.fromJson(Map<String, dynamic> json){
    return new Notifica(
      title: json['title'],
      content: json['Content'],
    );
  }
}
class Notilist extends StatefulWidget{
  const Notilist();
  @override
  _NotilistState createState() => _NotilistState();
}

class _NotilistState extends State<Notilist>{

  List<NotiItem> _notiItems = <NotiItem>[];

  @override
  Future<void> didChangeDependencies()async{
    if(_notiItems.isEmpty){
      await _fetchBooks();
    }
  }

  Future<void> _fetchBooks() async{
    final response = await http.get('http://101.132.153.104:8888/api/get_notification');
    final responsejson = json.decode(response.body);
    for(int i = 0; i < responsejson.length; i++){
      //books.add(Book.fromJson(responsejson[i]));
      Notifica curnoti = Notifica.fromJson(responsejson[i]);
      var curitem = NotiItem(
        title: curnoti.title,
        content: curnoti.content,
      );
      _notiItems.add(curitem); 
    }
    //return Book.fromJson(responsejson[1]);
  }

  Widget _buildNotiItems(){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _notiItems[index],
      itemCount: _notiItems.length,
    );
  }

  @override
  Widget build(BuildContext context){
    final listview = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildNotiItems(),
    );

    return new MaterialApp(
      title: 'Notification List',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: listview,
      ),
    );
  }
}