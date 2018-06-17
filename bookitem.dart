import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class BookItem extends StatelessWidget{
  final String name;
  final int totalNum;
  const BookItem({
    @required this.name,
    @required this.totalNum,
  });

  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: Colors.blue,
          splashColor: Colors.blue,
          onTap: (){
            print('I am tapped!');
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.book,
                  ),
                ),
                Center(
                  child: Text(name+'\n'+'总数：$totalNum本'),
                ),
                
              ]
              ),
            ),
          ),
      ),
    );
  }
}