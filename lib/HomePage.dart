import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:team_sparta_17/schedule_service.dart';
import 'HomePage_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String inputDateY = "";
  String inputDateM = "";
  String inputDateD = "";
  @override
  Widget build(BuildContext context) {
    print("빌드전");
    return Consumer<ScheduleService>(
        builder: (context, scheduleService, child) {
      print("빌드후");
      List<Schedule> scheduleList = scheduleService.scheduleList;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '스터디플래너',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
          ),
          backgroundColor: Color(0xffCFFFE5),
        ),
        body: ListView.builder(
          itemCount: scheduleList.length,
          itemBuilder: (context, index) {
            return Cell(
              schedule: scheduleList[index],
              index: index,
            );
          },
          //데이터 받아오는곳
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("추가"),
                    content: Container(
                      height: 250,
                      child: Column(
                        children: [
                          TextField(
                            maxLength: 2,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(labelText: '년도'),
                            onChanged: (text) {
                              inputDateY = text;
                            },
                          ),
                          TextField(
                            maxLength: 2,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(labelText: '월'),
                            onChanged: (text) {
                              inputDateM = text;
                            },
                          ),
                          TextField(
                            maxLength: 2,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(labelText: '일'),
                            onChanged: (text) {
                              inputDateD = text;
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("취소"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          scheduleService.createSchedule(
                              date: '$inputDateY년$inputDateM월$inputDateD일');
                          inputDateY = '';
                          inputDateM = '';
                          inputDateD = '';
                        },
                        child: Text("확인"),
                      ),
                    ],
                  );
                });
          },
          child: Icon(Icons.add, color: Colors.black),
          backgroundColor: Color(0xffCFFFE5),
        ),
      );
    });
  }
}
