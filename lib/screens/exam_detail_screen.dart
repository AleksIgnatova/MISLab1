import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({required this.exam, Key? key}) : super(key: key);

  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subjectName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 6),
                Text(
                  "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} "
                  "во ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 6),
                Text(
                  "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} "
                  "во ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.room),
                SizedBox(width: 6),
                Text(exam.rooms.join(', ')),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Време до испит: ${getTimeRemaining()}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
