import 'package:flutter/material.dart';
import 'package:team_sparta_17/schedule_service.dart';

class tempPage extends StatefulWidget {
  const tempPage({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  State<tempPage> createState() => _tempPageState();
}

class _tempPageState extends State<tempPage> {
  @override
  Widget build(BuildContext context) {
    Schedule schedule = widget.schedule;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '임시페이지',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
        ),
        backgroundColor: Color(0xffCFFFE5),
      ),
      body: ListView.builder(
          itemCount: schedule.schedule_datail.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text("할일 타이틀 : ${schedule.schedule_datail[index].title}//////"),
                Text("할일 내용 : ${schedule.schedule_datail[index].context}"),
              ],
            );
          }),
    );
  }
}
