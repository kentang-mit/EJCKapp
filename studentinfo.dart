import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bookitem.dart';

class Student{
  final String name;
  final String jaccount;
  final String classId;
  final String stuId;
  final String academy;

  Student({this.name, this.jaccount, this.classId, this.stuId, this.academy});

  factory Student.fromJson(Map<String, dynamic> json){
    return new Student(
      name: json['name'],
      jaccount: json['account'],
      classId: '',
      stuId: json['code'],
      academy: json['organize']['name']
    );
  }
}

class StudentInfo extends StatefulWidget{
  final String token;
  StudentInfo(this.token);
  @override
  _StudentInfoState createState() => _StudentInfoState(token);
}

class _StudentInfoState extends State<StudentInfo>{
  String token;
  Student curStudent=null;
  _StudentInfoState(tk){
    token = tk;
  }
  @override
  Future<void> didChangeDependencies()async{
    if(curStudent == null){
      await _fetchStudentInformation();
    }
  }

  Future<void> _fetchStudentInformation() async{
    final response = await http.get('https://api.sjtu.edu.cn/v1/me/profile?access_token=$token');
    final responsejson = json.decode(response.body);
    final decodedjson = responsejson['entities'][0];
    setState((){
      curStudent = Student.fromJson(decodedjson);
    });
    print(curStudent.name);
    //return Book.fromJson(responsejson[1]);
  }


  @override
  Widget build(BuildContext context){
   
    if(curStudent != null){
      return Text(curStudent.name+"(学号："+curStudent.stuId+"), 欢迎回来～");
    }
    else{
      return CircularProgressIndicator();
    }
  }
}