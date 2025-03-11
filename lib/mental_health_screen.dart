import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.grey[100],
    ),
    home: const MentalHealthScreen(),
  ));
}

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<Map<String, dynamic>> moods = [
      {'emoji': '😊', 'text': 'Senang', 'color': Colors.green},
      {'emoji': '😔', 'text': 'Sedih', 'color': Colors.blue},
      {'emoji': '😡', 'text': 'Marah', 'color': Colors.red},
      {'emoji': '😰', 'text': 'Cemas', 'color': Colors.orange},
      {'emoji': '😴', 'text': 'Lelah', 'color': Colors.grey},
    ];

    final List<Map<String, dynamic>> resources = [
      {
        'title': 'Tips Mengelola Kecemasan',
        'description': 'Teknik pernapasan, meditasi, dan strategi kognitif.',
        'icon': Icons.spa,
        'isPremium': false,
      },
      {
        'title': 'Jurnal Mood Digital',
        'description': 'Catatan harian untuk melacak mood Anda.',
        'icon': Icons.book,
        'isPremium': false,
      },
      {
        'title': 'Meditasi Terpandu',
        'description': 'Audio meditasi untuk relaksasi dan tidur lebih baik.',
        'icon': Icons.headphones,
        'isPremium': true,
      },
    ];

    final List<Map<String, dynamic>> hotlines = [
      {
        'title': 'Layanan Konseling Kampus',
        'subtitle': 'Tersedia sesi konseling gratis untuk mahasiswa.',
        'contact': '0812-3456-7890',
        'isWebsite': false,
        'hours': 'Senin-Jumat, 08.00-16.00',
      },
      {
        'title': 'Bantuan Kesehatan Mental Nasional',
        'subtitle': 'Layanan darurat 24/7 untuk kesehatan mental.',
        'contact': '119',
        'isWebsite': false,
        'hours': '24 jam setiap hari',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        elevation: 0,
        title: const Text(
          'Dukungan Kesehatan Mental',
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
        actions: [
          Icon(Icons.notifications_outlined),
        ],
      ),
      body: Container(
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            // Mood Tracker Section
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE7F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.emoji_emotions,
                          color: Color(0xFF4A148C),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bagaimana perasaan Anda hari ini?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A148C),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tap pada emoji yang sesuai',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: moods.map((mood) {
                      final isSelected = mood['text'] == 'Senang';
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFD1C4E9)
                                  : Colors.grey.withOpacity(0.1),
                              shape: BoxShape.circle,
                              border: isSelected
                                  ? Border.all(
                                      color: const Color(0xFF4A148C),
                                      width: 2,
                                    )
                                  : null,
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: Colors.purple.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Text(
                              mood['emoji'],
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            mood['text'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected
                                  ? const Color(0xFF4A148C)
                                  : Colors.grey[800],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  // Recommendation for selected mood
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3E5F5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFD1C4E9),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rekomendasi untuk mood "Senang"',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A148C),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Bagus! Gunakan mood positif ini untuk melakukan aktivitas yang Anda sukai atau membantu teman yang mungkin sedang membutuhkan dukungan.',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Daily Stats Card
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.timeline,
                        color: Color(0xFF4A148C),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Statistik Mingguan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A148C),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('70%', 'Mood Positif'),
                      _buildStatItem('85%', 'Check-in'),
                      _buildStatItem('4/7', 'Mindfulness'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Resources Section
            Row(
              children: [
                const Icon(
                  Icons.psychology,
                  color: Color(0xFF4A148C),
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Sumber Daya',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A148C),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Resources List
            ...resources
                .map((resource) => Container(
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
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEDE7F6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                resource['icon'],
                                color: const Color(0xFF4A148C),
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          resource['title'],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF212121),
                                          ),
                                        ),
                                      ),
                                      if (resource['isPremium'])
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFF8E1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Text(
                                            'Premium',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    resource['description'],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),

            const SizedBox(height: 24),

            // Emergency Contacts Section
            const Row(
              children: [
                Icon(
                  Icons.support_agent,
                  color: Color(0xFF4A148C),
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Kontak Darurat',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A148C),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Silakan hubungi jika Anda memerlukan bantuan:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),

            // Hotlines List
            ...hotlines
                .map((hotline) => Container(
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
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEDE7F6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    hotline['isWebsite']
                                        ? Icons.public
                                        : Icons.phone,
                                    color: const Color(0xFF4A148C),
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotline['title'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF212121),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        hotline['subtitle'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3E5F5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        hotline['isWebsite']
                                            ? Icons.link
                                            : Icons.call,
                                        color: const Color(0xFF4A148C),
                                        size: 16,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        hotline['contact'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4A148C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 14,
                                  color: Color(0xFF673AB7),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Jam operasional: ${hotline['hours']}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),

            // Appointment Button - display only
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16, top: 16),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF4A148C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_today, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Jadwalkan Konsultasi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6),
            shape: BoxShape.circle,
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A148C),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
