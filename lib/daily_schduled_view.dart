import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:team_sparta_17/Schedule.dart';

class DailyScheduledView extends StatefulWidget {
  const DailyScheduledView({Key? key}) : super(key: key);

  @override
  State<DailyScheduledView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DailyScheduledView> {
  Schedule dummySchedule = Schedule("2023년 7월 4일", "수학공부",
      "수학공부합니다 수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            dummySchedule.date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromRGBO(207, 255, 229, 1.0),
        ),
      ),
    );
  }
}
