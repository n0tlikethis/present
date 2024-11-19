import 'package:flutter/material.dart';

import 'package:present/models/attendance.dart';
import 'package:present/models/student.dart';
import 'package:present/providers/attendance_provider.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  void onStudentCheckChanged(bool? value, int index) {
    setState(() {
      students[index].isPresent = value ?? false;
    });
  }

  void saveAttendance() {
    int presentCount = students.where((student) => student.isPresent).length;
    int absentCount = students.length - presentCount;

    final attendance =
        Attendance(presentCount: presentCount, absentCount: absentCount);
    final attendanceNotifier = AttendanceProvider.of(context);
    attendanceNotifier.value = List<Attendance>.from(attendanceNotifier.value)
      ..add(attendance);
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      for (int i = 0; i < students.length; i++) {
        students[i].isPresent = false;
      }
      // students.forEach((student) => student.isPresent = false);
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Data telah berhasil disimpan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presensi Siswa'), centerTitle: true),
      body: students.isEmpty
          ? const Center(child: Text('Tidak ada data siswa.'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(students[index].name),
                  value: students[index].isPresent,
                  onChanged: (bool? value) {
                    onStudentCheckChanged(value, index);
                  },
                );
              },
            ),
      floatingActionButton: students.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 15),
              child: FloatingActionButton(
                onPressed: saveAttendance,
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
                child: const Icon(Icons.save),
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
