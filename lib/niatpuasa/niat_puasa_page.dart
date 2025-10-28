import 'package:flutter/material.dart';

class NiatPuasaPage extends StatelessWidget {
  const NiatPuasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Niat Puasa Ramadhan', 'tag': 'Wajib', 'route': '/detailNiatRamadhan'},
      {'title': 'Niat Puasa Sunnah', 'tag': 'Sunnah', 'route': '/detailNiatSunnah'},
      {'title': 'Niat Puasa Senin', 'tag': 'Sunnah', 'route': '/detailNiatSenin'},
      {'title': 'Niat Puasa Kamis', 'tag': 'Sunnah', 'route': '/detailNiatKamis'},
      {'title': 'Niat Puasa Ayyamul Bidh', 'tag': 'Sunnah', 'route': '/detailNiatAyyamulBidh'},
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 204, 174),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ====== Header dengan bulan & bintang ======
              Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.nights_stay,
                      color: Color(0xFF8AA87B), size: 40),
                  Positioned(
                    top: 6,
                    right: MediaQuery.of(context).size.width / 2 - 10,
                    child: const Icon(Icons.star,
                        size: 12, color: Color(0xFFFFD966)),
                  ),
                  Positioned(
                    top: 14,
                    right: MediaQuery.of(context).size.width / 2 - 22,
                    child: const Icon(Icons.star,
                        size: 8, color: Color(0xFFFFD966)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Niat Puasa',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Panduan lengkap niat puasa wajib & sunnah',
                style: TextStyle(fontSize: 13, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // ====== Daftar Item ======
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final e = items[index];
                    final isWajib = e['tag'] == 'Wajib';
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCEAD7),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                e['title']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isWajib
                                    ? const Color(0xFFF8C8C8)
                                    : const Color.fromARGB(255, 177, 220, 179),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                e['tag']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: isWajib
                                      ? const Color(0xFFB74D4D)
                                      : const Color(0xFF4E9A57),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(context, e['route']!),
                      ),
                    );
                  },
                ),
              ),

              // ====== Tombol Panah Kembali ======
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 136, 172, 132),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
