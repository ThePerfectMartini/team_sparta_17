import 'package:flutter/material.dart';
import 'package:team_sparta_17/data_service.dart';

class Edit extends StatefulWidget {
  Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
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
                  final String title = titleController.text;
                  final String content = contentController.text;
                  final String date = dateController.text;

                  dataService.addNewData(
                      Data(title: title, content: content, date: date));

                  Navigator.pop(context,
                      {'제목': title, '내용': content, '날짜': date}); // 이전 화면으로 돌아가기
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
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
              onChanged: (value) {},
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
              height: 350.0,
              child: TextField(
                controller: contentController,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  hintText: '내용을 입력해주세요',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
