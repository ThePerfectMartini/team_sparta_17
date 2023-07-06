import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';
import 'package:team_sparta_17/Service/ScheduleService.dart';
import 'package:team_sparta_17/editPage.dart';
import '../Model/Schedule.dart';

class ScheduleCell extends StatelessWidget {
  final Schedule schedule;
  const ScheduleCell({Key? key, required this.schedule}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    final scheduleService = Provider.of<ScheduleService>(context);

    void navigateToEditPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPage(
            initialDate: schedule.date,
            initialTitle: schedule.title,
            initialContent: schedule.context,
          ),
        ),
      );
    }

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
                      style: AppFonts.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    flex: 1,
                  ),
                  IconButton(
                    onPressed: navigateToEditPage,
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      // 삭제
                      scheduleService.deleteSchedule(schedule);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              Text(
                "${schedule.context}",
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
