import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'schedule_service.dart';

class Cell extends StatefulWidget {
  const Cell({
    Key? key,
    required this.date,
    required this.count,
    required this.index,
  }) : super(key: key);

  final String date;
  final int count;
  final int index;
  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    if (widget.count == 0) {
      // 요소 없을때 휴지통 아이콘 출현
      return Consumer<ScheduleService>(
          builder: (context, scheduleService, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
          child: Container(
            height: 55,
            color: Color(0xff76D3B2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: IconButton(
                        onPressed: () {
                          scheduleService.deleteSchedule(index: widget.index);
                        },
                        icon: Icon(Icons.delete_forever),
                      ),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "할일목록 0개",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    } else {
      return Padding(
        //일반 셀
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
        child: Container(
          height: 55,
          color: Color(0xff76D3B2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.date,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "할일목록 ${widget.count}개",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
