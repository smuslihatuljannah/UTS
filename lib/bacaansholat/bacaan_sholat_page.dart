import 'package:flutter/material.dart';
import 'detail_bacaan_page.dart';

class BacaanSholatPage extends StatelessWidget {
  const BacaanSholatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bacaanList = [
      {'judul': 'Takbiratul Ihram', 'key': 'takbir'},
      {'judul': 'Doa Iftitah', 'key': 'iftitah'},
      {'judul': 'Surat Al-Fatihah', 'key': 'fatihah'},
      {'judul': 'Rukuk', 'key': 'rukuk'},
      {'judul': 'I\'tidal', 'key': 'itidal'},
      {'judul': 'Sujud', 'key': 'sujud'},
      {'judul': 'Duduk di antara Dua Sujud', 'key': 'duduk'},
      {'judul': 'Tasyahhud Awal', 'key': 'tasyahhud_awal'},
      {'judul': 'Tasyahhud Akhir', 'key': 'tasyahhud_akhir'},
      {'judul': 'Salam', 'key': 'salam'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEAF6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.green, size: 24),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Bacaan Sholat",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                "Panduan lengkap bacaan sholat harianmu",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: bacaanList.length,
                  itemBuilder: (context, index) {
                    final item = bacaanList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.menu_book_rounded,
                              color: Colors.green),
                        ),
                        title: Text(
                          item['judul']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black54, size: 16),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailBacaanPage(
                                judul: item['judul']!,
                                keyData: item['key']!,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
