import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Schedule.dart';

class ScheduleCell extends StatelessWidget {
  final Schedule schedule;
  const ScheduleCell({Key? key, required this.schedule}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${schedule.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    flex: 1,
                  ),
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
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
