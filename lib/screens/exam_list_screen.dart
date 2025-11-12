import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final String studentIndex;

  ExamListScreen({required this.studentIndex, Key? key}) : super(key: key);

  final List<Exam> exams = [
    Exam(
      subjectName: 'Математика',
      dateTime: DateTime(2025, 11, 20, 10, 0),
      rooms: ['A101'],
    ),
    Exam(
      subjectName: 'Физика',
      dateTime: DateTime(2025, 11, 18, 14, 0),
      rooms: ['B202'],
    ),
    Exam(
      subjectName: 'Хемија',
      dateTime: DateTime(2025, 11, 25, 9, 0),
      rooms: ['C303'],
    ),
    Exam(
      subjectName: 'Информатика',
      dateTime: DateTime(2025, 11, 22, 12, 0),
      rooms: ['D404'],
    ),
    Exam(
      subjectName: 'Англиски јазик',
      dateTime: DateTime(2025, 11, 19, 11, 0),
      rooms: ['E505'],
    ),
    Exam(
      subjectName: 'Македонски јазик',
      dateTime: DateTime(2025, 11, 24, 15, 0),
      rooms: ['F606'],
    ),
    Exam(
      subjectName: 'Историја',
      dateTime: DateTime(2025, 11, 21, 13, 0),
      rooms: ['G707'],
    ),
    Exam(
      subjectName: 'Географија',
      dateTime: DateTime(2025, 11, 26, 10, 0),
      rooms: ['H808'],
    ),
    Exam(
      subjectName: 'Биологија',
      dateTime: DateTime(2025, 11, 23, 9, 0),
      rooms: ['I909'],
    ),
    Exam(
      subjectName: 'Филозофија',
      dateTime: DateTime(2025, 11, 27, 14, 0),
      rooms: ['J1010'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(title: Text('Распоред за испити - $studentIndex')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ExamDetailScreen(exam: exams[index]),
                      ),
                    );
                  },
                  child: ExamCard(exam: exams[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text('Вкупно испити: ${exams.length}'),
              backgroundColor: Colors.blueAccent,
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
