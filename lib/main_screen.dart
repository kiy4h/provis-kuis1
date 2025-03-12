import 'package:flutter/material.dart';
import 'jadwal_todo_screen.dart';
import 'home_screen.dart';
import 'medsos_screen.dart';
import 'pesan_group_screen.dart';
import 'elearning_screen.dart';
import 'notifikasi_screen.dart';

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
    HomeScreen(), // Pindah ke Home Screen
    MedsosScreen(), // Pindah ke Medsos Screen
    ElearningScreen(), // Pindah ke E-Learning Screen
    JadwalTodoScreen(), // Pindah ke Jadwal & To-Do Screen
    ChatScreen(),
    NotifikasiScreen()
  ];
  final Color primaryColor = const Color(0xFF4A148C);

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
      appBar: const SearchableAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              accountName:
                  Text("Zaning", style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text("Level 3 • 1200 XP"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/student.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: primaryColor),
              title: Text("Beranda"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.school, color: primaryColor),
              title: Text("Kelas Saya"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: primaryColor),
              title: Text("Jadwal"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.assessment, color: primaryColor),
              title: Text("Nilai & Sertifikat"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: primaryColor),
              title: Text("Pengaturan"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help, color: primaryColor),
              title: Text("Bantuan"),
              onTap: () {},
            ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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

class SearchableAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchableAppBar({super.key});

  @override
  State<SearchableAppBar> createState() => _SearchableAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _SearchableAppBarState extends State<SearchableAppBar> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF4A148C),
      toolbarHeight: 80,
      elevation: 0,
      title: _isSearching
          ? TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Cari pengumuman, materi kuliah",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Color(0xFFEDE7F6)),
                filled: false,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEDE7F6)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEDE7F6)),
                ),
              ),
              style: const TextStyle(color: Color(0xFFEDE7F6)),
              cursorColor: const Color(0xFFEDE7F6),
              onSubmitted: (_) {
                setState(() {
                  _isSearching = false;
                });
              },
            )
          : const Text(
              'E-Campus',
              style: TextStyle(
                color: Color(0xFFEDE7F6),
                fontWeight: FontWeight.w600,
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
      actions: [
        IconButton(
          icon: Icon(
            _isSearching ? Icons.close : Icons.search,
            color: const Color(0xFFEDE7F6),
            size: 26,
          ),
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 40,
              color: Color(0xFFEDE7F6),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
