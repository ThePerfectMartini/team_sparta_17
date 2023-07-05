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
//데이터 보내시고 받으실때 Schedule타입으로 보내고 받으시면 됩니다.
//schedule 타입 안에 date 날짜 String으로 있고 ScheduleDetail 자료형에 [제목,내용]들이
//리스트로 들어 있습니다.

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
