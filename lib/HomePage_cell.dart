import 'package:flutter/material.dart';
import 'package:team_sparta_17/Model/Schedule.dart';

class Cell extends StatefulWidget {
  const Cell({
    Key? key,
    required this.schedules,
  }) : super(key: key);

  final List<Schedule> schedules;

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    // if (widget. == 0) {
    //   // 요소 없을때 휴지통 아이콘 출
    //   return Padding(
    //     padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
    //     child: Container(
    //       height: 55,
    //       color: Color(0xff76D3B2),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Row(
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: Icon(Icons.delete_forever),
    //               ),
    //               Text(
    //                 widget.schedules[0].date,
    //                 style: TextStyle(fontSize: 20),
    //               ),
    //             ],
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(15),
    //             child: Text(
    //               "할일목록 0개",
    //               style: TextStyle(fontSize: 20),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // } else {
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
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.schedules[0].date,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "할일목록 ${widget.schedules.length} 개",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
    // }
  }
}
