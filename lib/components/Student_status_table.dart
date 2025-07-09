import 'package:flutter/material.dart';

class StudentStatusTable extends StatelessWidget {
  const StudentStatusTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Student Status',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            columnWidths: const {
              0: FlexColumnWidth(1.3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Colors.blueAccent),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('year', style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Subject',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Score', style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Grade', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Text('2024')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Math')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('95')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('A')),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Text('2023')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Science')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('88')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('B+')),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Text('2022')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Science')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('75')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('B')),
                ],
              ),
            ],
          ),
        ),
      ],
    ); // Replace with your actual widget implementation
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your actual widget implementation
  }
}
