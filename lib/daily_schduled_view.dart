import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DailyScheduledView extends StatefulWidget {
  const DailyScheduledView({Key? key}) : super(key: key);

  @override
  State<DailyScheduledView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DailyScheduledView> {
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
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "2023년 07월 04일",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
