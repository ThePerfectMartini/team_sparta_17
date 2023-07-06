import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:team_sparta_17/Model/Schedule.dart';
import 'package:team_sparta_17/Resource/AppColors.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';
import 'package:team_sparta_17/Service/ScheduleService.dart';
import 'package:team_sparta_17/View/round_plus_button.dart';
import 'package:team_sparta_17/View/schedule_cell.dart';
import '../editPage.dart';

class DailyScheduledView extends StatefulWidget {
  // final String date;
  final List<Schedule> selectedSchedules;
  const DailyScheduledView({Key? key, required this.selectedSchedules})
      : super(key: key);

  @override
  State<DailyScheduledView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DailyScheduledView> {
  @override
  Widget build(BuildContext context) {
    final ScheduleService scheduleService =
        Provider.of<ScheduleService>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scheduleService.selectDate("");
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
            ),
          ),
          title: Text(
            scheduleService.selectedDate,
            style: AppFonts.title,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.selectedSchedules.length,
                      itemBuilder: (context, index) {
                        return ScheduleCell(
                            schedule: widget.selectedSchedules[index]);
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: RoundCrossButton(
                  size: 67,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditPage(
                                initialContent: '',
                                initialTitle: '',
                                initialDate: '',
                              )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
