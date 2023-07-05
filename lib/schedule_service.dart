import 'package:flutter/material.dart';

import 'main.dart';

class Schedule {
  Schedule({
    required this.date,
    required this.schedule_datail,
  });

  String date;
  List schedule_datail;
}

class ScheduleDetail {
  ScheduleDetail({
    required this.title,
    required this.context,
  });

  String title;
  String context;
}

class ScheduleService extends ChangeNotifier {
  List<Schedule> scheduleList = [
    Schedule(date: '23년07월05일', schedule_datail: []),
    Schedule(date: '23년07월06일', schedule_datail: [
      ScheduleDetail(title: '할일', context: '내용'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: [
      ScheduleDetail(title: '할일', context: '내용'),
      ScheduleDetail(title: '수학공부', context: '미적분'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: [
      ScheduleDetail(title: '할일', context: '내용'),
      ScheduleDetail(title: '수학공부', context: '미적분'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: [
      ScheduleDetail(title: '할일', context: '내용'),
      ScheduleDetail(title: '수학공부', context: '미적분'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: []),
  ];

  deleteSchedule({required int index}) {
    scheduleList.removeAt(index);
    notifyListeners();
  }

  createSchedule({required String date}) {
    Schedule schedule = Schedule(date: date, schedule_datail: []);
    scheduleList.add(schedule);
    notifyListeners();
  }
}
