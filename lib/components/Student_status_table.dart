import 'package:flutter/material.dart';
import 'package:student_management_system_app/services/getStudentData.dart';

class StudentStatusTable extends StatelessWidget {
  const StudentStatusTable({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: studentGrade(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('Error loading data ${snapshot.error}'),
          );
        } else {
          final data = snapshot.data!;
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
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "year",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "subject",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Total",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Avarage',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    ...List.generate((data).length, (index) {
                      final subject = data[index];
                      print(subject);
                      return TableRow(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(subject["year"].toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              subject["subjectResults"][index]["subjectName"],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(subject["totalScore"].toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(subject["averageScore"].toString()),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );

    // Replace with your actual widget implementation
  }
}
