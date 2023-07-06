import 'package:flutter/material.dart';
import 'package:team_sparta_17/Model/Schedule.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';

class ScheduleDetailView extends StatelessWidget {
  final Schedule schedule;
  const ScheduleDetailView({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          schedule.date,
          style: AppFonts.title,
        ),
        Divider(
          height: 30,
          thickness: 1,
          color: Colors.black,
        ),
        Text(
          schedule.title,
          style: AppFonts.title,
        ),
        Divider(
          height: 30,
          thickness: 1,
          color: Colors.black,
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
