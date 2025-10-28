import 'package:flutter/material.dart';

class DetailNiatRamadhanPage extends StatelessWidget {
  const DetailNiatRamadhanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3EA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====== Header hijau dengan bulan dan tombol kembali ======
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF4A9369),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFB4D1B2),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Icon(Icons.nights_stay, color: Colors.white70, size: 48),
                const SizedBox(height: 8),
                const Text(
                  'Niat Puasa Ramadhan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Wajib',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          // ====== Isi konten ======
          Expanded(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BACAAAN ARAB',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEAD7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'نَوَيْتُ صَوْمَ غَدٍ عَنْ أَدَاءِ فَرْضِ شَهْرِ رَمَضَانَ هَذِهِ السَّنَةِ لِلّٰهِ تَعَالَى',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Scheherazade',
                        color: Colors.black87,
                        height: 1.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'BACAAAN LATIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Nawaitu shauma ghadin 'an adā’i fardhi syahri ramadhāna hādzihis-sanati lillāhi ta‘ālā",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'ARTINYA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Saya niat berpuasa esok hari untuk menunaikan kewajiban puasa bulan Ramadhan tahun ini karena Allah Ta'ala.",
                      style: TextStyle(fontSize: 14, height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A9369),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb, color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Tips: Niat puasa dibaca pada malam hari sebelum imsak atau sebelum terbit fajar.",
                            style: TextStyle(
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
