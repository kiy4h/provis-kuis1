import 'package:flutter/material.dart';

void main() {
  runApp(ElearningScreen());
}

class ElearningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.deepPurple,
        ),
      ),
      home: ElearningDisplay(),
    );
  }
}

class ElearningDisplay extends StatelessWidget {
  // Warna utama - ungu
  final Color primaryColor = Colors.deepPurple;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text(
          "E-Campus",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.message), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              accountName: Text("Zaning", style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text("Level 3 • 1200 XP"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/student.jpg'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan gradien
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang Kembali,",
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
                  ),
                  Text(
                    "Zaning",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari kursus atau materi...",
                        prefixIcon: Icon(Icons.search, color: primaryColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Kemajuan Belajar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kemajuan Belajar",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Circular progress indicators
                          progressIndicator("75%", "Algoritma"),
                          progressIndicator("30%", "Jaringan"),
                          progressIndicator("50%", "Mobile"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Kursus Terbaru
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kursus Terbaru",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lihat Semua",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 230, // Sedikit ditambah tingginya
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                children: [
                  courseCard("Algoritma & Pemrograman", "Rosa Ariani Sukamto, M.T.", "4.8", "21 Modul"),
                  courseCard("Machine Learning", "Prof. Dr. Lala Septem Riza, M.T.", "4.7", "18 Modul"),
                  courseCard("Pengembangan Web", "Herbert, S.Kom., M.T.", "4.9", "24 Modul"),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Jadwal Hari Ini
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Jadwal Hari Ini",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  scheduleCard(
                    "Struktur Data",
                    "09:00 - 10:30",
                    "Rosa Ariani Sukamto, M.T.",
                    Colors.green.withOpacity(0.2),
                    Colors.green,
                  ),
                  scheduleCard(
                    "Jaringan Komputer",
                    "13:00 - 14:30",
                    "Eddy Prasetyo Nugroho, M.T.",
                    Colors.orange.withOpacity(0.2),
                    Colors.orange,
                  ),
                  scheduleCard(
                    "Praktikum Mobile",
                    "15:00 - 17:00",
                    "Dr. Yudi Wibisono, S.T., M.T.",
                    Colors.purple.withOpacity(0.2),
                    Colors.purple,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            // Menu Fitur Tambahan
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Fitur Akademik",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  featureButton(Icons.calendar_today, "Jadwal\nKuliah", primaryColor),
                  featureButton(Icons.assignment, "Tugas &\nUjian", primaryColor),
                  featureButton(Icons.book, "Materi\nKuliah", primaryColor),
                  featureButton(Icons.assessment, "Laporan\nAkademik", primaryColor),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget Kemajuan Belajar
  Widget progressIndicator(String percentage, String title) {
    double value = double.parse(percentage.replaceAll('%', '')) / 100;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                strokeWidth: 8,
              ),
            ),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      ],
    );
  }

  // Widget Kursus Card - Perbaikan untuk menghindari overflow
  Widget courseCard(String title, String instructor, String rating, String modules) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: primaryColor.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                Icons.play_circle_filled,
                color: primaryColor,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 42, // Tetapkan tinggi fixed untuk judul
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  instructor,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 3),
                        Text(rating),
                      ],
                    ),
                    Text(modules, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Jadwal Card
  Widget scheduleCard(String subject, String time, String lecturer, Color bgColor, Color iconColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.book, color: iconColor),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 3),
                Text(lecturer, style: TextStyle(color: Colors.grey[700])),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
              ),
              SizedBox(height: 3),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Aktif",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // Widget Fitur Button
  Widget featureButton(IconData icon, String title, Color color) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}