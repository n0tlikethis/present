import 'package:flutter/material.dart';
import 'package:present/models/data_layer.dart';

class AttendanceProvider
    extends InheritedNotifier<ValueNotifier<List<Attendance>>> {
  const AttendanceProvider(
      {super.key,
      required super.child,
      required ValueNotifier<List<Attendance>> super.notifier});

  static ValueNotifier<List<Attendance>> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AttendanceProvider>()!
        .notifier!;
  }
}
