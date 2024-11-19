import 'package:flutter/material.dart';
import 'package:present/models/attendance.dart';
import 'package:present/providers/attendance_provider.dart';
import 'package:present/views/main_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AttendanceProvider(
        notifier: ValueNotifier<List<Attendance>>(const []),
        child: const MaterialApp(
          home: MainScreen(),
        ));
  }
}
