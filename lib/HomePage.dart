import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:team_sparta_17/schedule_service.dart';
import 'HomePage_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '스터디플래너';
  @override
  Widget build(BuildContext context) {
    print("빌드전");
    return Consumer<ScheduleService>(
        builder: (context, scheduleService, child) {
      print("빌드후");
      List<Schedule> scheduleList = scheduleService.scheduleList;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
          ),
          backgroundColor: Color(0xffCFFFE5),
        ),
        body: ListView.builder(
          itemCount: scheduleList.length,
          itemBuilder: (context, index) {
            return Cell(
              date: scheduleList[index].date,
              count: scheduleList[index].schedule_datail.length,
              index: index,
            );
          },
          //데이터 받아오는곳
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scheduleService.createSchedule(date: "새로추가");
          },
          child: Icon(Icons.add, color: Colors.black),
          backgroundColor: Color(0xffCFFFE5),
        ),
      );
    });
  }
}
