import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({required this.exam, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final color = isPast ? Colors.grey[300] : Colors.green[100];

    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subjectName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 6),
                Text(
                  "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} "
                  "во ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                ),
                SizedBox(width: 12),
                Icon(Icons.access_time, size: 16),
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
                Icon(Icons.room, size: 16),
                SizedBox(width: 6),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
