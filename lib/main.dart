import 'package:flutter/material.dart';
import 'package:task_page/member.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: members(),
      
    );
  }
}