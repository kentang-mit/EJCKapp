import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

const _padding = EdgeInsets.all(16.0);

class NotiDetail extends StatelessWidget{
  final String title;
  final String content;
  //final double price;
  //final String author;
  //final String publisher;
  //final String detailInformation;

  const NotiDetail({
    @required this.title,
    @required this.content,
  }
  ): assert(title!=null),
    assert(content!=null);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text(title),),
      body: new Text(content));
  }
}
