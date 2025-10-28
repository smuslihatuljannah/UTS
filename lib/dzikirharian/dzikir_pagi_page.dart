import 'package:flutter/material.dart';
import 'tasbih_page.dart'; // pastikan sudah diimport

class DzikirPagiPage extends StatelessWidget {
  const DzikirPagiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dzikirList = [
      {'title': 'Subhanallah', 'arab': 'سُبْحَانَ اللهِ'},
      {'title': 'Alhamdulillah', 'arab': 'الْـحَمْدُ للهِ'},
      {'title': 'Allahu Akbar', 'arab': 'اللهُ أَكْبَرُ'},
      {'title': 'Laa ilaaha illallah', 'arab': 'لَا إِلٰهَ إِلَّا اللهُ'},
      {'title': 'Astaghfirullah', 'arab': 'أَسْتَغْفِرُ اللهَ الْعَظِيمَ'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE6F8EE),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text(
          'List Dzikir',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dzikirList.length,
        itemBuilder: (context, index) {
          final item = dzikirList[index];
          return GestureDetector(
            onTap: () {
              // ✅ Saat diklik, pindah ke halaman TasbihPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TasbihPage(
                    dzikirLatin: item['title']!,
                    dzikirArab: item['arab']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.repeat, color: Colors.green.shade700),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text(
                    '33x',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
