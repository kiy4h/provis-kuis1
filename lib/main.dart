import 'package:flutter/material.dart';
import 'package:kuis/akademik_screen.dart';
import 'package:kuis/detail_akademik.dart';
import 'package:kuis/elearning_screen.dart';
import 'package:kuis/keuangan_screen.dart';
import 'package:kuis/tambah_keuangan.dart';
import 'package:kuis/mental_health_screen.dart';
import 'package:kuis/notifikasi_screen.dart';
import 'package:kuis/pesan_group_screen.dart';
import 'package:kuis/chat_screen.dart';
import 'main_screen.dart';
import 'jadwal_todo_screen.dart';
import 'medsos_screen.dart';
import 'up_medsos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Route',
      routes: {
        '/': (context) => QuizScreen(),
        '/main': (context) => MainScreen(),
        '/medsos': (context) => MedsosScreen(),
        '/medsos_upload': (context) => UpMedsos(),
        '/mental_health': (context) => MentalHealthScreen(),
        '/akademik': (context) => AkademikScreen(),
        '/detail_akademik': (context) => DetailAkademik(),
        '/keuangan': (context) => KeuanganScreen(),
        '/pengeluaran': (context) => TambahPengeluaran(),
        '/elearning': (context) => ElearningDisplay(),
        '/jadwal_todo1': (context) => JadwalTodoScreen(
              initialTabIndex: 0,
            ),
        '/jadwal_todo2': (context) => JadwalTodoScreen(
              initialTabIndex: 1,
            ),
        '/jadwal_todo3': (context) => JadwalTodoScreen(
              initialTabIndex: 2,
            ),
        '/pesan_group': (context) => ChatScreen(),
        '/chat': (context) => Chatting(),
        '/notifikasi': (context) => NotifikasiScreen(),
      },
    );
  }
}

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});
  final Map<String, String> quizOptions = {
    "Main screen": "/main",
    "Medsos screen": "/medsos",
    "Medsos: Tambah konten": "/medsos_upload",
    "Mental health screen": "/mental_health",
    "Akademik screen": "/akademik",
    "Akademik: bagian Detail Akademik": "/detail_akademik",
    "Keuangan screen": "/keuangan",
    "Keuangan: bagian Tambah Pengeluaran": "/pengeluaran",
    "E-learning screen": "/elearning",
    "Jadwal & todo screen (Jadwal kuliah)": "/jadwal_todo1",
    "Jadwal & todo: Deadline tugas": "/jadwal_todo2",
    "Jadwal & todo: To-do list": "/jadwal_todo3",
    "Pesan & group screen": "/pesan_group",
    "Pesan & group: bagian Chat": "/chat",
    "Notifikasi screen": "/notifikasi",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Quiz 1",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ...quizOptions.entries.map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(entry.value);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: entry.key,
                        style: TextStyle(
                          fontWeight: entry.key.contains(":")
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
