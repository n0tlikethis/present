import 'package:flutter/material.dart';

import 'package:present/providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceHistory = AttendanceProvider.of(context).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Kehadiran'),
        centerTitle: true,
      ),
      body: attendanceHistory.isEmpty
          ? const Center(child: Text('Tidak ada data riwayat kehadiran.'))
          : ListView.builder(
              itemCount: attendanceHistory.length,
              itemBuilder: (context, index) {
                final record = attendanceHistory[index];
                return ListTile(
                  title: Text(record.date.toString()),
                  subtitle: Text(
                      'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}'),
                );
              },
            ),
    );
  }
}
