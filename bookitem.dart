import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'bookdetail.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class BookItem extends StatelessWidget{
  final String name;
  final int totalNum;
  const BookItem({
    @required this.name,
    @required this.totalNum,
  });

  void _navigateToDetail(context){
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              '详细信息',
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
          ),
          body: BookDetail(
            name: name,
            totalNum: totalNum,
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