import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

const _padding = EdgeInsets.all(16.0);

class BookDetail extends StatelessWidget{
  final String name;
  final int totalNum;
  //final double price;
  //final String author;
  //final String publisher;
  //final String detailInformation;

  const BookDetail({
    @required this.name,
    @required this.totalNum,
  }
  ): assert(name!=null),
    assert(totalNum!=null);

  @override
  Widget build(BuildContext context){
    final information = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          InputDecorator(
            child: Text(
              name,
              //style: Theme.of(context).textTheme.display1,
            ),
            decoration: InputDecoration(
              labelText: '书名',
              labelStyle: Theme.of(context).textTheme.display1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          )
        ]  
      ),
    );
    return new Scaffold(body: information);
  }
}
