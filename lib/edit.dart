import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

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
    );
  }
}
