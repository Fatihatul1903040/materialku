import 'package:flutter/material.dart';
import 'package:materialku/DataBarang.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Materialku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataBarang(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new DataBarang(),
      },
    );
  }
}
