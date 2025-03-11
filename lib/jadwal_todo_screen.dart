import 'package:flutter/material.dart';

class JadwalTodoScreen extends StatefulWidget {
  const JadwalTodoScreen({super.key});

  @override
  JadwalTodoScreenState createState() => JadwalTodoScreenState();
}

class JadwalTodoScreenState extends State<JadwalTodoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> todoList = [
    "Mengerjakan tugas Provis",
    "Mengerjakan tugas Analisis & Desain Algoritma",
    "Mengerjakan tugas Metodologi Penelitian",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void addTodo(String todo) {
    setState(() {
      todoList.add(todo);
    });
  }

  void removeTodo(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal & To-Do"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Jadwal"),
            Tab(text: "Deadline"),
            Tab(text: "To-Do"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          JadwalTab(),
          DeadlineTab(),
          TodoTab(todoList: todoList, addTodo: addTodo, removeTodo: removeTodo),
        ],
      ),
    );
  }
}

// Placeholder untuk masing-masing tab
class JadwalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("📅 Jadwal Kuliah",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildJadwalCard("Pemrograman Visual", "09:30 - C205"),
          _buildJadwalCard("Data Mining", "13:00 - C307")
        ],
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
}

class DeadlineTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("⏳ Deadline Tugas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildJadwalCard("Tubes 1 Provis", "Besok, 19:00"),
        ],
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
}

class TodoTab extends StatelessWidget {
  final List<String> todoList;
  final Function(String) addTodo;
  final Function(int) removeTodo;

  TodoTab(
      {required this.todoList,
      required this.addTodo,
      required this.removeTodo});

  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text("📝 To-Do List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildTodoInput(),
          const SizedBox(height: 8),
          Expanded(child: _buildTodoList()),
        ],
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
              addTodo(_todoController.text);
              _todoController.clear();
            }
          },
          child: const Text("Tambah"),
        ),
      ],
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
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
                removeTodo(index);
              },
            ),
          ),
        );
      },
    );
  }
}
