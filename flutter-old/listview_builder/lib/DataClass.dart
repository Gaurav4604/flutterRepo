import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataClass{
  String value,name;
  Color priority;
  DataClass({this.value,this.name,this.priority});

  String showcase(){
    if(value.length>30){
      String ok=value.substring(0,30);
      return "$ok...";
    }
    else
      return value;
  }
  static Color bleh(int val){
    switch(val){
      case 0:
        return Colors.red;
        break;
      case 1:
        return Colors.orange;
        break;
      case 2:
        return Colors.lightGreenAccent;
        break;
    }
  }
}