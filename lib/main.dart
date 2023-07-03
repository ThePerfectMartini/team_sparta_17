import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("안녕하세요 공성표입니다."),
        ),
        body: Center(
          child: Text("공성표 홍성철 전상혁", style: TextStyle(fontSize: 40)),
        ),
      ),
    );
  }
}
