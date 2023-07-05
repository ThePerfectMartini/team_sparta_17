import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_sparta_17/schedule_service.dart';
import 'HomePage.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScheduleService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '17조',
      home: const HomePage(),
    );
  }
}
