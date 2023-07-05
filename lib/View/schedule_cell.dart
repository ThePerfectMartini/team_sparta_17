import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';
import 'package:team_sparta_17/data_service.dart';

class ScheduleCell extends StatelessWidget {
  final Data schedule;
  final DataService dataService;

  const ScheduleCell(
      {Key? key, required this.schedule, required this.dataService})
      : super(key: key);

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
                      "${schedule.title ?? ''}",
                      style: AppFonts.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                "${schedule.content ?? ''}",
                style: AppFonts.body,
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
