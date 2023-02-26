import 'package:flutter/material.dart';
import '../model/exam.dart';
import '../widgets/exam_list.dart';


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
      body: ExamList(
        exams: exams,
        onAddExam: _addExam,
        onDeleteExam: (int index) {
          setState(() {
            exams.removeAt(index);
          });
        },
      ),
    );
  }
}
