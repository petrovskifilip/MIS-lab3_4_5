import 'package:flutter/material.dart';
import '../model/exam.dart';

class ExamScheduleScreen extends StatefulWidget {
  @override
  _ExamScheduleScreenState createState() => _ExamScheduleScreenState();
}

class _ExamScheduleScreenState extends State<ExamScheduleScreen> {
  List<Exam> exams = [
    Exam(
        subject: "Mobilni informaciski sistemi",
        date: DateTime(2023, 2, 26),
        timeSlot: "10:00 - 12:00"),
  ];

  void _addExam() {
    setState(() {
      exams.add(Exam(
          subject: "Ispit", date: DateTime.now(), timeSlot: "9:00 - 11:00"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Termini za ispiti i kolokviumi"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (BuildContext context, int index) {
                Exam exam = exams[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    title: Text(exam.subject,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exam.timeSlot,
                            style: const TextStyle(color: Colors.grey)),
                        Text("Date: ${exam.date.toUtc().toString()}",
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          exams.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _addExam,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text("Dodadi ispit"),
            ),
          ),
        ],
      ),
    );
  }
}
