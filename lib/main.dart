import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'form.dart';
import 'form_data.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Text('Home'),),
      routes: {
        'form':(context)=>MyForm(),
        'formData':(context)=>FormData()
      },
      initialRoute: 'form',

    );
  }
}
