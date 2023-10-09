import 'package:flutter/material.dart';
import 'package:listview_builder/ListviewClass.dart';
import 'package:listview_builder/TextInput.dart';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "home",
    routes: {
      "home":(context)=>ListViewClass(),
      "textInput":(context)=>TextInput(),
    },
  )
);

