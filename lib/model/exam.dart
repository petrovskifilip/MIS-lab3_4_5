
class Exam {
  final String subject;
  final DateTime date;
  final String timeSlot;
  String? location;

  Exam({required this.subject, required this.date, required this.timeSlot, this.location});
}