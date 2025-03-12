import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4A148C),
        fontFamily: 'Poppins',
      ),
      home: MedsosScreen(),
    );
  }
}

class MedsosScreen extends StatefulWidget {
  @override
  _MedsosScreenState createState() => _MedsosScreenState();
}

class _MedsosScreenState extends State<MedsosScreen> {
  @override
  Widget build(BuildContext context) {
    // ini masih kosong, blm diisi !!!!!!!!!
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A148C),
        elevation: 0,
        title: Text(
          "Medsos Mahasiswa",
          style: TextStyle(
            color: Color(0xFFEDE7F6),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        // AppBar lurus tanpa lengkungan
        actions: [
          Icon(Icons.notifications_outlined, color: Color(0xFFEDE7F6)),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEDE7F6),
              Colors.white,
            ],
          ),
        ),
        child: _buildScrollableContent(),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Color(0xFF4A148C),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  
  Widget _buildScrollableContent() {
    // Dummy data untuk postingan dengan path gambar dari assets
    List<Map<String, dynamic>> posts = [
      {
        'name': 'Raka Pratama',
        'content': 'Sedang belajar Flutter untuk tugas akhir. Wish me luck! 📱💻',
        'type': 'status',
        'time': '15 menit yang lalu',
        'likes': 12,
        'comments': 3,
        'image': null,
      },
      {
        'name': 'Anisa Wijaya',
        'content': 'Pemandangan kampus pagi ini sangat indah!',
        'type': 'photo',
        'time': '1 jam yang lalu',
        'likes': 45,
        'comments': 7,
        'image': 'assets/images/campus.jpg', // Contoh path gambar
      },
      {
        'name': 'Budi Santoso',
        'content': 'Demo project aplikasi mobile saya semester ini',
        'type': 'video',
        'time': '3 jam yang lalu',
        'likes': 32,
        'comments': 15,
        'image': null,
      },
      {
        'name': 'Diana Putri',
        'content': 'Ujian minggu depan, siapa yang sudah siap? Saya mau buat grup belajar, yang minat comment ya!',
        'type': 'status',
        'time': '5 jam yang lalu',
        'likes': 27,
        'comments': 21,
        'image': null,
      },
      {
        'name': 'Eko Prasetyo',
        'content': 'Dokumentasi kegiatan seminar kemarin',
        'type': 'photo',
        'time': '1 hari yang lalu',
        'likes': 89,
        'comments': 12,
        'image': 'assets/images/seminar.jpg', 
      },
    ];
    
    return ListView(
      padding: EdgeInsets.only(bottom: 80), // Memberikan ruang di bagian bawah
      children: [
        // Post Status Card (sekarang bagian dari konten yang bisa di-scroll)
        Card(
          margin: EdgeInsets.all(10),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF4A148C),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFFE0E0E0)),
                        ),
                        child: Text(
                          "Apa yang sedang terjadi?",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Tombol untuk menambahkan Foto/Video/Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPostButton(Icons.image, "Foto", Color(0xFF4CAF50)),
                    _buildPostButton(Icons.videocam, "Video", Color(0xFFE53935)),
                    _buildPostButton(Icons.text_fields, "Status", Color(0xFF4A148C)),
                  ],
                ),
                SizedBox(height: 10),
                // Tombol Posting
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF4A148C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Posting",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
        
        // Daftar postingan
        ...posts.map((post) => _buildPostCard(post)).toList(),
      ],
    );
  }
  
  Widget _buildPostButton(IconData icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPostCard(Map<String, dynamic> post) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header postingan (avatar, nama, waktu)
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFD1C4E9),
                  child: Text(
                    post['name'][0],
                    style: TextStyle(
                      color: Color(0xFF4A148C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        post['time'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
            SizedBox(height: 10),
            
            // Isi Postingan
            Text(
              post['content'],
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            
            // Media (Foto/Video) dari assets atau placeholder
            if (post['type'] != 'status')
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFE1BEE7).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: post['image'] != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          post['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      )
                    : Center(
                        child: post['type'] == 'photo'
                            ? Icon(Icons.image, size: 50, color: Color(0xFF4A148C).withOpacity(0.5))
                            : Icon(Icons.play_circle_outline, size: 50, color: Color(0xFF4A148C).withOpacity(0.5)),
                      ),
              ),
            
            SizedBox(height: 10),
            
            // Like & Comment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 20, color: Colors.grey[700]),
                    SizedBox(width: 5),
                    Text('${post['likes']}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey[700]),
                    SizedBox(width: 5),
                    Text('${post['comments']}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.share_outlined, size: 20, color: Colors.grey[700]),
                    SizedBox(width: 5),
                    Text('Bagikan'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}