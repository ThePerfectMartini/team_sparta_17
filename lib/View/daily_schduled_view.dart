import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:team_sparta_17/Model/Schedule.dart';
import 'package:team_sparta_17/Resource/AppColors.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';
import 'package:team_sparta_17/View/round_plus_button.dart';
import 'package:team_sparta_17/View/schedule_cell.dart';
import '../Service/ScheduleService.dart';

class DailyScheduledView extends StatefulWidget {
  final String date;
  const DailyScheduledView({Key? key, required this.date}) : super(key: key);

  @override
  State<DailyScheduledView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DailyScheduledView> {
  Schedule dummySchedule = Schedule("2023년 7월 4일", "수학공부공부공부공부공부공부",
      "수학공부합니다 수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다\n수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다수학공부합니다");
  @override
  Widget build(BuildContext context) {
    final scheduleService = Provider.of<ScheduleService>(context);
    List<Schedule> schedules = scheduleService.getSchedulesByDate(widget.date);

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
                  itemCount: schedules.length,
                  itemBuilder: (BuildContext, index) {
                    return ScheduleCell(schedule: schedules[index]);
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
