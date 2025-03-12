import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.grey[100],
    ),
    home: const NotifikasiScreen(),
  ));
}

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C), // Deep purple
        elevation: 0,
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Color(0xFFEDE7F6),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: const NotificationListView(),
    );
  }
}

class NotificationListView extends StatelessWidget {
  const NotificationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample notification data
    final List<Map<String, dynamic>> notifications = [
      {
        'type': 'Todo',
        'title': 'Tugas PEMROGRAMAN VISUAL',
        'message': 'Deadline pengumpulan tugas pemrograman visual mobile',
        'time': '23:59',
        'date': 'Hari ini',
        'icon': Icons.assignment,
        'color': const Color(0xFF2196F3), // Blue
      },
      {
        'type': 'Pengumuman',
        'title': 'LIBUR RAMADHAN',
        'message':
            'Perkuliahan ditiadakan pada tanggal 21 Maret - 6 April  2025',
        'time': '10:15',
        'date': 'Kemarin',
        'icon': Icons.campaign,
        'color': const Color(0xFFFF9800), // Orange
      },
      {
        'type': 'Reminder',
        'title': 'KONSULTASI TUGAS BESAR',
        'message': 'Jadwal konsultasi dengan Dr. Yudi Wibisono, S.T., M.T.',
        'time': '14:00',
        'date': 'Besok',
        'icon': Icons.notification_important,
        'color': const Color(0xFFE91E63), // Pink
      },
      {
        'type': 'Agenda',
        'title': 'PRESENTASI KELOMPOK',
        'message': 'Presentasi kelompok untuk mata kuliah Sistem Operasi',
        'time': '10:30',
        'date': '20 Mar 2025',
        'icon': Icons.event,
        'color': const Color(0xFF009688), // Teal
      },
      {
        'type': 'Jadwal',
        'title': 'DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        'message': 'Kuliah akan dimulai pukul 13:00 di Lab Komputer',
        'time': '12:30',
        'date': 'Besok',
        'icon': Icons.schedule,
        'color': const Color(0xFF673AB7), // Medium purple
      },
      {
        'type': 'Pengumuman',
        'title': 'PEMELIHARAAN SISTEM',
        'message':
            'Sistem akademik akan mengalami pemeliharaan pada akhir pekan',
        'time': '09:00',
        'date': '17 Mar 2025',
        'icon': Icons.campaign,
        'color': const Color(0xFFFF9800), // Orange
      },
      {
        'type': 'Todo',
        'title': 'LAPORAN PRAKTIKUM SISTEM OPERASI',
        'message': 'Deadline pengumpulan laporan praktikum',
        'time': '23:59',
        'date': '22 Mar 2025',
        'icon': Icons.assignment,
        'color': const Color(0xFF2196F3), // Blue
      },
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFEDE7F6), // Very light purple
            Colors.white,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryItem('Jadwal', '2', Icons.schedule),
                  _buildSummaryItem('Todo', '2', Icons.assignment),
                  _buildSummaryItem('Pengumuman', '2', Icons.campaign),
                  _buildSummaryItem('Lainnya', '2', Icons.more_horiz),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Filter chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterChip('Semua', true),
                  _buildFilterChip('Jadwal', false),
                  _buildFilterChip('Todo', false),
                  _buildFilterChip('Pengumuman', false),
                  _buildFilterChip('Reminder', false),
                  _buildFilterChip('Agenda', false),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Notifikasi Terbaru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A148C),
              ),
            ),
            const SizedBox(height: 12),

            // Notifications list
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(notification: notifications[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFD1C4E9),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4A148C),
            size: 20,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A148C),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF4A148C),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        selected: isSelected,
        onSelected: (bool selected) {},
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFF4A148C),
        checkmarkColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isSelected ? Colors.transparent : const Color(0xFFD1C4E9),
          ),
        ),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      color: notification['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      notification['icon'],
                      color: notification['color'],
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Type chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: notification['color'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            notification['type'],
                            style: TextStyle(
                              color: notification['color'],
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Title
                        Text(
                          notification['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF212121),
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Message
                        Text(
                          notification['message'],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Time and date
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${notification['time']} • ${notification['date']}',
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
