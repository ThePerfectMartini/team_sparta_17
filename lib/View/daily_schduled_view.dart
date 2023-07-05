import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:team_sparta_17/Model/Schedule.dart';
import 'package:team_sparta_17/Resource/AppColors.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';
import 'package:team_sparta_17/View/round_plus_button.dart';
import 'package:team_sparta_17/View/schedule_cell.dart';

class DailyScheduledView extends StatefulWidget {
  const DailyScheduledView({Key? key}) : super(key: key);

  @override
  State<DailyScheduledView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DailyScheduledView> {
  Schedule dummySchedule = Schedule("2023년 7월 4일", "수학공부공부공부공부공부공부",
      "수학공부합니다 수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다\n수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다");
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
              color: AppColors.blackColor,
            ),
          ),
          title: Text(
            dummySchedule.date,
            style: AppFonts.title,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Center(
          child: Stack(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext, index) {
                    return ScheduleCell(schedule: dummySchedule);
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: RoundCrossButton(
                  size: 67,
                  onPressed: () {
                    // 추가
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
