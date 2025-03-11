import 'package:flutter/material.dart';
import 'package:kuis/pesan_group_screen.dart';
import 'package:kuis/chat_screen.dart';
import 'main_screen.dart';
import 'jadwal_todo_screen.dart';
import 'medsos_screen.dart';

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
        '/mental_health': (context) => QuizScreen(),
        '/akademik': (context) =>
            QuizScreen(), // TODO: Ganti dengan AkademikScreen
        '/keuangan': (context) =>
            QuizScreen(), // TODO: Ganti dengan KeuanganScreen
        '/elearning': (context) =>
            QuizScreen(), // TODO: Ganti dengan ElearningScreen
        '/jadwal_todo': (context) => JadwalTodoScreen(),
        '/pesan_group': (context) => ChatScreen(),
        '/chat': (context) => Chatting(),
        '/notifikasi': (context) =>
            QuizScreen(), // TODO: Ganti dengan NotifikasiScreen
      },
    );
  }
}

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});
  final Map<String, String> quizOptions = {
    "Main screen": "/main",
    "Medsos screen": "/medsos",
    "Mental health screen": "/mental_health",
    "Akademik screen": "/akademik",
    "Keuangan screen": "/keuangan",
    "E-learning screen": "/elearning",
    "Jadwal & todo screen": "/jadwal_todo",
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
                    child: Text(entry.key),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
