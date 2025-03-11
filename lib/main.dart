import 'package:flutter/material.dart';
import 'main_screen.dart';

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
        '/main': (context) => HomeScreen()
      },
    );
  }
}

class QuizScreen extends StatelessWidget {
  final Map<String, String> quizOptions = {
    "Main screen": "/main",
    "Mental health screen": "/mental_health",
    "Akademik screen": "/akademik",
    "Keuangan screen": "/keuangan",
    "E-learning screen": "/elearning",
    "Medsos screen": "/medsos",
    "Jadwal & todo screen": "/jadwal_todo",
    "Pesan & group screen": "/pesan_group",
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
