import 'package:flutter/material.dart';
import 'package:team_sparta_17/data_service.dart';
import 'package:team_sparta_17/edit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataService dataService = Provider.of<DataService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("핫픽스"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "공성표 홍성철 전상혁",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edit()),
                );
              },
              child: Text('편집화면으로 이동'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '저장된 데이터',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: dataService.dateList.length,
              itemBuilder: (context, index) {
                Data data = dataService.dateList[index];
                return ListTile(
                  title: Text(data.date ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title ?? ''),
                      Text(data.content ?? ''),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
