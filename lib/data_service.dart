import 'package:flutter/material.dart';

class Data {
  Data({required this.content, required this.date, this.title});

  String? date;
  String? title;
  String? content;
}

class DataService extends ChangeNotifier {
  List<Data> dataList = [];

  List<String> dateList = [];
  List<String> titleList = [];
  List<String> contentList = [];

  void addNewData(Data newData) {
    dataList.add(newData);

    dateList.add(newData.date!);
    titleList.add(newData.title ?? '');
    contentList.add(newData.content ?? '');
    notifyListeners();
  }
}
