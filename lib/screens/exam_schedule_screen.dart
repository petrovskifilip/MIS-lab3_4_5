import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  Future<String?> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks.first.name;
  }

  void _addExam() async {
    String? location = await _getLocation();
    setState(() {
      exams.add(Exam(
          subject: "Ispit",
          date: DateTime.now(),
          timeSlot: "9:00 - 11:00",
          location: location));
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
