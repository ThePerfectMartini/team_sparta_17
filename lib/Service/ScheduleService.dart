import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';
import '../Model/Schedule.dart';

class ScheduleService with ChangeNotifier {
  Map<String, List<Schedule>> _schedules = {};

  Map<String, List<Schedule>> get schedules => _schedules;

  void addSchedule(Schedule schedule) {
    final date = schedule.date;
    if (!_schedules.containsKey(date)) {
      _schedules[date] = [];
    }
    _schedules[date]!.add(schedule);
    notifyListeners();
  }

  void updateSchedule(Schedule beforeSchedule, Schedule updatedSchedule) {
    final date = updatedSchedule.date;
    if (_schedules.containsKey(date)) {
      List<Schedule> scheduleList = _schedules[date]!;
      int scheduleIndex = scheduleList.indexOf(beforeSchedule);
      if (scheduleIndex != -1) {
        scheduleList[scheduleIndex] = updatedSchedule;
        notifyListeners();
      }
    }
  }

  void deleteSchedule(Schedule schedule) {
    final date = schedule.date;
    if (_schedules.containsKey(date)) {
      List<Schedule> scheduleList = _schedules[date]!;
      if (scheduleList.remove(schedule)) {
        notifyListeners();
      }
    }
  }

  List<Schedule> getSchedulesByDate(String date) {
    if (_schedules.containsKey(date)) {
      return _schedules[date]!;
    } else {
      return [];
    }
  }
}
