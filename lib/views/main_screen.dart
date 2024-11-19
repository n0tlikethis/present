import 'package:flutter/material.dart';
import 'package:present/views/history_screen.dart';
import 'package:present/views/record_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreen = 0;

  final List<Widget> _halaman = [
    const RecordScreen(), // Halaman untuk mencatat kehadiran.
    const HistoryScreen(), // Halaman untuk melihat riwayat.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _halaman[_selectedScreen], // Menampilkan halaman yang dipilih.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        onTap: (indeks) {
          setState(() {
            _selectedScreen = indeks;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
      ),
    );
  }
}
