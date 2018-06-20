import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

Future<Storage> fetchStorage() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var clasnum = (prefs.getString('classnum') ?? "未登录");
  // print(clasnum);
  return new Storage(clasnum);

}

class Storage{
  final String classnum;
  Storage(String cla):classnum=cla;
  // Storage({this.classnum});
}

void setClassnum(clnum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('classnum', clnum);
  }