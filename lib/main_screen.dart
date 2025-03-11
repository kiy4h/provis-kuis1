import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
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
            icon: const Icon(Icons.account_circle, size: 30),
            onPressed: () {},
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
      body: Column(
        children: [
          // Carousel Slider untuk Beasiswa
          Padding(
            padding: const EdgeInsets.all(10),
            child: CarouselSlider(
              options: CarouselOptions(height: 150, autoPlay: true),
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 50),
                          const Text("Beasiswa Sampurna",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text("Beasiswa untuk siswa berprestasi."),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),

          // Kuliah & Tugas
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kuliah hari ini ...",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    "Pemrograman Visual, 9.30 (C205); Data Mining 13.00 (C307)"),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tugas", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Tubes 1 Provis (besok, 19.00)"),
              ],
            ),
          ),

          // Menu Grid
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                _buildMenuItem(Icons.favorite, "Mental Health"),
                _buildMenuItem(Icons.folder, "Akademik"),
                _buildMenuItem(Icons.account_balance_wallet, "Keuangan"),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Medsos"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Elearning"),
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

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[50],
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: Colors.purple),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
