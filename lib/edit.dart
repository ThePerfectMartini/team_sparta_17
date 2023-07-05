import 'package:flutter/material.dart';
import 'package:team_sparta_17/data.dart';

class Edit extends StatelessWidget {
  Edit({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

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
                  // 작성한 내용을 날짜화면에 저장하는 작업 및 제목과 내용을 가져와서 처리하는 코드 작성
                  Data.title = titleController.text;
                  Data.content = contentController.text;
                  Data.date = dateController.text;

                  print('날짜: ${Data.date}');
                  print('제목: ${Data.title}');
                  print('내용: ${Data.content}');
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
