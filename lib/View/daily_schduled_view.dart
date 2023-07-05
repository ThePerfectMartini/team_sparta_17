import 'package:flutter/material.dart';
import 'package:team_sparta_17/Resource/AppColors.dart';
import 'package:team_sparta_17/Resource/AppFonts.dart';
import 'package:team_sparta_17/View/round_plus_button.dart';
import 'package:team_sparta_17/View/schedule_cell.dart';
import 'package:team_sparta_17/data_service.dart';
import 'package:team_sparta_17/edit.dart';

class DailyScheduledView extends StatefulWidget {
  const DailyScheduledView({Key? key}) : super(key: key);

  @override
  State<DailyScheduledView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DailyScheduledView> {
  final DataService dataService = DataService();
  String date = '';
  List<Data> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    final List<Data> dataList = dataService.dataList;
    if (dataList.isNotEmpty) {
      final Data firstData = dataList.first;
      setState(() {
        date = firstData.date ?? '';
      });
    }
  }

  void updateData(int index, String title, String content, String date) {
    setState(() {
      final Data newData = Data(title: title, content: content, date: date);
      dataList[index] = newData;
    });
  }

  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
            ),
          ),
          title: Text(
            date,
            style: AppFonts.title,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Center(
          child: Stack(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return ScheduleCell(
                      schedule: schedule, dataService: dataService,
                    ),
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: RoundCrossButton(
                  size: 67,
                  onPressed: () {
                    // 추가
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Edit()),
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
