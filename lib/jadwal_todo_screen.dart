import 'package:flutter/material.dart';

class JadwalTodoScreen extends StatefulWidget {
  final int initialTabIndex; // Add this

  const JadwalTodoScreen({super.key, this.initialTabIndex = 0});

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
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTabIndex, // Set the initial tab
    );
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
        backgroundColor:
            const Color(0xFF4A148C), // Deep purple - matching notifikasi_screen
        elevation: 0,
        title: const Text(
          "Jadwal & To-Do",
          style: TextStyle(
            color: Color(0xFFEDE7F6),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFEDE7F6),
          indicatorWeight: 3,
          labelColor: const Color(0xFFEDE7F6),
          unselectedLabelColor: const Color(0xFFD1C4E9),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: "Jadwal Kuliah"),
            Tab(text: "Deadline Tugas"),
            Tab(text: "To-Do List"),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(
                  0xFFEDE7F6), // Very light purple - matching notifikasi_screen
              Colors.white,
            ],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            JadwalTab(),
            DeadlineTab(),
            TodoTab(
                todoList: todoList, addTodo: addTodo, removeTodo: removeTodo),
          ],
        ),
      ),
    );
  }
}

// Placeholder untuk masing-masing tab
class JadwalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample jadwal data
    final List<Map<String, dynamic>> jadwalList = [
      {
        'title': 'Pemrograman Visual',
        'room': 'C205',
        'time': '09:30 - 12:00',
        'lecturer': 'Dr. Yudi Wibisono, S.T., M.T.',
        'icon': Icons.computer,
        'color': const Color(0xFF2196F3), // Blue - matching notifikasi_screen
      },
      {
        'title': 'Data Mining',
        'room': 'C307',
        'time': '13:00 - 15:30',
        'lecturer': 'Dr. Lala Septem Riza, M.T.',
        'icon': Icons.analytics,
        'color': const Color(0xFF009688), // Teal - matching notifikasi_screen
      },
      {
        'title': 'Sistem Operasi',
        'room': 'Lab Komputer',
        'time': '15:30 - 18:00',
        'lecturer': 'Dr. Enjun Junaeti, M.Si.',
        'icon': Icons.settings,
        'color': const Color(
            0xFF673AB7), // Medium purple - matching notifikasi_screen
      },
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Jadwal Kuliah",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A148C),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: jadwalList.length,
              itemBuilder: (context, index) {
                return _buildJadwalCard(jadwalList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJadwalCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.purple.withOpacity(0.1),
            highlightColor: Colors.purple.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon with colored background
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: data['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      data['icon'],
                      color: data['color'],
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          data['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF212121),
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Time and room
                        Text(
                          "${data['time']} • Ruang ${data['room']}",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Lecturer
                        Text(
                          data['lecturer'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DeadlineTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample deadline data
    final List<Map<String, dynamic>> deadlineList = [
      {
        'title': 'Tubes 1 Provis',
        'deadline': 'Besok, 19:00',
        'description': 'Implementasi UI/UX design menggunakan Flutter',
        'icon': Icons.assignment,
        'color': const Color(0xFFE91E63), // Pink - matching notifikasi_screen
        'urgency': 'High',
      },
      {
        'title': 'Laporan Praktikum Sistem Operasi',
        'deadline': '22 Mar 2025, 23:59',
        'description':
            'Dokumentasi hasil praktikum instalasi Linux dan konfigurasinya',
        'icon': Icons.assignment_outlined,
        'color': const Color(0xFF2196F3), // Blue - matching notifikasi_screen
        'urgency': 'Medium',
      },
      {
        'title': 'Makalah Metodologi Penelitian',
        'deadline': '25 Mar 2025, 12:00',
        'description': 'Review jurnal terkait topik penelitian yang dipilih',
        'icon': Icons.description,
        'color': const Color(0xFFFF9800), // Orange - matching notifikasi_screen
        'urgency': 'Low',
      },
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Deadline Tugas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A148C),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: deadlineList.length,
              itemBuilder: (context, index) {
                return _buildDeadlineCard(deadlineList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeadlineCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.purple.withOpacity(0.1),
            highlightColor: Colors.purple.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon with colored background
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: data['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      data['icon'],
                      color: data['color'],
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Urgency chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: data['color'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            data['urgency'],
                            style: TextStyle(
                              color: data['color'],
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Title
                        Text(
                          data['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF212121),
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Description
                        Text(
                          data['description'],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Deadline
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              data['deadline'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoTab extends StatelessWidget {
  final List<String> todoList;
  final Function(String) addTodo;
  final Function(int) removeTodo;

  TodoTab({
    required this.todoList,
    required this.addTodo,
    required this.removeTodo,
  });

  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "To-Do List",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A148C),
            ),
          ),
          const SizedBox(height: 16),
          _buildTodoInput(context),
          const SizedBox(height: 16),
          Expanded(child: _buildTodoList()),
        ],
      ),
    );
  }

  Widget _buildTodoInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                hintText: "Tambahkan To-Do...",
                hintStyle: TextStyle(
                  color: Color(0xFFBBBBBB),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF212121),
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
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A148C),
              foregroundColor: const Color(0xFFEDE7F6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: const Text(
              "Tambah",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoList() {
    // Associate each todo with an icon and color
    final List<Map<String, dynamic>> icons = [
      {'icon': Icons.assignment, 'color': const Color(0xFF2196F3)},
      {'icon': Icons.description, 'color': const Color(0xFFE91E63)},
      {'icon': Icons.book, 'color': const Color(0xFF009688)},
    ];

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        // Cycle through the icons list
        final iconData = icons[index % icons.length];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.purple.withOpacity(0.1),
                highlightColor: Colors.purple.withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon with colored background
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: iconData['color'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          iconData['icon'],
                          color: iconData['color'],
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Content
                      Expanded(
                        child: Text(
                          todoList[index],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF212121),
                          ),
                        ),
                      ),

                      // Delete button
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Color(0xFFE91E63),
                          size: 20,
                        ),
                        onPressed: () {
                          removeTodo(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
