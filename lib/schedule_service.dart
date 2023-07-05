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

class Schedule_detail {
  Schedule_detail({
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
      Schedule_detail(title: '할일', context: '내용'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: [
      Schedule_detail(title: '할일', context: '내용'),
      Schedule_detail(title: '수학공부', context: '미적분'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: [
      Schedule_detail(title: '할일', context: '내용'),
      Schedule_detail(title: '수학공부', context: '미적분'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: [
      Schedule_detail(title: '할일', context: '내용'),
      Schedule_detail(title: '수학공부', context: '미적분'),
    ]),
    Schedule(date: '23년07월07일', schedule_datail: []),
  ];

  deleteSchedule({required int index}) {
    print(scheduleList);
    scheduleList.removeAt(index);
    notifyListeners();
    print(scheduleList);
    print("휴지통클릭");
  }
}
