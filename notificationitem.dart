import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'notificationdetail.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class NotiItem extends StatelessWidget{
  final String title;
  final String content;
  const NotiItem({
    @required this.title,
    @required this.content,
  });

  void _navigateToDetail(context){
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context){
        return Scaffold(
          body: NotiDetail(
            title: title,
            content: content,
          ),
        );
      } 
      )
    );
  }
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
            _navigateToDetail(context);
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
                  child: Text(title),
                ),
                
              ]
              ),
            ),
          ),
      ),
    );
  }
}