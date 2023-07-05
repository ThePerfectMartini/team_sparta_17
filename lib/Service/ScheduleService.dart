import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Schedule.dart';
import '../Model/SortingDirection.dart';

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

  List<List<Schedule>> getAllSchedulesSortBy(
      {SortingDirection direction = SortingDirection.Descending}) {
    List<List<Schedule>> sortedSchedules = [];
    final sortedDates;
    switch (direction) {
      case SortingDirection.Ascending:
        sortedDates = _schedules.keys.toList()..sort();
        break;
      case SortingDirection.Descending:
        sortedDates = _schedules.keys.toList()..sort((a, b) => b.compareTo(a));
        break;
    }
    for (String date in sortedDates) {
      List<Schedule> scheduleList = _schedules[date]!;
      sortedSchedules.add(scheduleList);
    }
    return sortedSchedules;
  }
}
