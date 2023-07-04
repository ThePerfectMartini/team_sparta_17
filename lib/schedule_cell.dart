import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Schedule.dart';

class ScheduleCell extends StatelessWidget {
  final Schedule schedule;
  const ScheduleCell({Key? key, required this.schedule}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${schedule.title}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  // 수정
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  // 삭제
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          Text(
            "${schedule.context}",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
