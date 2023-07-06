import 'package:flutter/material.dart';
import 'package:team_sparta_17/Model/Schedule.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';

class ScheduleDetailView extends StatelessWidget {
  final Schedule schedule;
  const ScheduleDetailView({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          schedule.date,
          style: AppFonts.title,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          schedule.title,
          style: AppFonts.title,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  schedule.context,
                  style: AppFonts.body,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
