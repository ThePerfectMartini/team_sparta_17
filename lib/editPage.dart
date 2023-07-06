import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_sparta_17/Model/Schedule.dart';
import 'Model/Schedule.dart';
import 'Service/ScheduleService.dart';

class EditPage extends StatelessWidget {
  final Schedule? inputSchedule;

  EditPage({Key? key, this.inputSchedule}) : super(key: key);

  final TextEditingController dateController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final scheduleService = Provider.of<ScheduleService>(context);

    dateController.text = inputSchedule?.date ?? '';
    titleController.text = inputSchedule?.title ?? '';
    contentController.text = inputSchedule?.context ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 255, 229),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  // 작성한 내용을 날짜화면에 저장하는 작업 및 제목과 내용을 가져와서 처리하는 코드 작성
                  String date = dateController.text;
                  String title = titleController.text;
                  String content = contentController.text;
                  Schedule currentSchedule = Schedule(date, title, content);
                  if (inputSchedule != null) {
                    scheduleService.updateSchedule(
                        inputSchedule!, currentSchedule);
                  } else {
                    scheduleService.addSchedule(currentSchedule);
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  '작성',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '날짜',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              TextField(
                controller: dateController,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  hintText: 'xxxx년 xx월 xx일',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                '제목',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              TextField(
                controller: titleController,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  hintText: '제목을 입력해주세요',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                '내용',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18.0,
              ),
              Container(
                height: 380.0,
                child: TextField(
                  controller: contentController,
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    hintText: '내용을 입력해주세요',
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
