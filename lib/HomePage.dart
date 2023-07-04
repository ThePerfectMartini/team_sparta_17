import 'package:flutter/material.dart';
import 'HomePage_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dummies = [
    {
      "date": '23년07월04일',
      "todos": ['g', 'gd'],
      "context": '내용',
    },
    {
      "date": '23년07월11일',
      "todos": [],
      "context": '내용',
    },
  ];
  //더미데이터

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "스터디플래너",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
          ),
          backgroundColor: Color(0xffCFFFE5),
        ),
        body: ListView.builder(
          itemCount: dummies.length,
          itemBuilder: (context, index) {
            return Cell(date: dummies[index]['date'].toString(), count: index);
          },
          //데이터 받아오는곳
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.black),
          backgroundColor: Color(0xffCFFFE5),
        ),
      ),
    );
  }
}
