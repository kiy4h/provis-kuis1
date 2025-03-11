import 'package:flutter/material.dart';
import 'jadwal_todo_screen.dart';
import 'medsos_screen.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MedsosScreen(), // Pindah ke Medsos Screen
    Center(
        child: Text("TODO: Elearning Screen",
            style: TextStyle(fontSize: 24))), // Placeholder untuk notifikasi
    JadwalTodoScreen(), // Pindah ke Jadwal & To-Do Screen
    Center(
        child: Text("TODO: Pesan & Group Screen",
            style: TextStyle(fontSize: 24))), // Placeholder untuk notifikasi
    Center(
        child: Text("TODO: Notifikasi Screen",
            style: TextStyle(fontSize: 24))), // Placeholder untuk notifikasi
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        toolbarHeight: 80,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Cari pengumuman, materi kuliah",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 60),
            onPressed: () {
              // TODO: add action to profile page
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("Menu")),
            ListTile(title: Text("Profil")),
            ListTile(title: Text("Pengaturan")),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        // Show labels at all times
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions), label: "Medsos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: "E-Learning"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Jadwal & Todo"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: "Pesan & Group"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifikasi"),
        ],
      ),
    );
  }
}
