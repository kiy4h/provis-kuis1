import 'package:flutter/material.dart';

class JadwalTodoScreen extends StatefulWidget {
  const JadwalTodoScreen({super.key});

  @override
  JadwalTodoScreenState createState() => JadwalTodoScreenState();
}

class JadwalTodoScreenState extends State<JadwalTodoScreen> {
  final List<String> todoList = [];
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jadwal & To-Do")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("📅 Jadwal Kuliah",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildJadwalCard("Pemrograman Visual", "09:30 - C205"),
            _buildJadwalCard("Data Mining", "13:00 - C307"),
            const SizedBox(height: 16),
            const Text("📝 Jadwal Tugas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildJadwalCard("Tubes 1 Provis", "Besok, 19:00"),
            const SizedBox(height: 16),
            const Text("✅ To-Do List",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildTodoInput(),
            const SizedBox(height: 8),
            _buildTodoList(),
          ],
        ),
      ),
    );
  }

  Widget _buildJadwalCard(String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }

  Widget _buildTodoInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _todoController,
            decoration: const InputDecoration(
              hintText: "Tambahkan To-Do...",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            if (_todoController.text.isNotEmpty) {
              setState(() {
                todoList.add(_todoController.text);
                _todoController.clear();
              });
            }
          },
          child: const Text("Tambah"),
        ),
      ],
    );
  }

  Widget _buildTodoList() {
    return Expanded(
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(todoList[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
