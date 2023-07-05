import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_sparta_17/Model/Schedule.dart';
import 'package:team_sparta_17/Service/ScheduleService.dart';
import 'package:team_sparta_17/View/daily_schduled_view.dart';
import 'package:team_sparta_17/edit.dart';
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
    final scheduleService = Provider.of<ScheduleService>(context);
    List<List<Schedule>> allSchedules = scheduleService.getAllSchedulesSortBy();
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
          itemCount: allSchedules.length,
          itemBuilder: (context, index) {
            return Builder(builder: (context) {
              return InkWell(
                onTap: () {
                  scheduleService.selectDate(allSchedules[index][0].date);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyScheduledView(
                        selectedSchedules: allSchedules[index],
                      ),
                    ),
                  );
                },
                child: Cell(
                  schedules: allSchedules[index],
                ),
              );
            });
          },
          //데이터 받아오는곳
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Edit()));
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Color(0xffCFFFE5),
          ),
        ),
      ),
    );
  }
}
