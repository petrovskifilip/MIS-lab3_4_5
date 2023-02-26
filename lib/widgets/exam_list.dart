import 'package:flutter/material.dart';

import '../model/exam.dart';


class ExamList extends StatelessWidget {
  final List<Exam> exams;
  final void Function() onAddExam;
  final void Function(int) onDeleteExam;

  const ExamList(
      {Key? key,
        required this.exams,
        required this.onAddExam,
        required this.onDeleteExam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      onDeleteExam(index);
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
            onPressed: onAddExam,
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
    );
  }
}