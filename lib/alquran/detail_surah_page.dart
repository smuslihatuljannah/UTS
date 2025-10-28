import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 🕌 Model Ayat
class Ayat {
  final int numberInSurah;
  final String text;        // Arab
  final String translation; // Terjemahan

  Ayat({
    required this.numberInSurah,
    required this.text,
    required this.translation,
  });
}

// 📖 Halaman Detail Surah
class DetailSurahPage extends StatefulWidget {
  final int surahNumber;
  final String surahName;
  final String surahLatin;

  const DetailSurahPage({
    super.key,
    required this.surahNumber,
    required this.surahName,
    required this.surahLatin,
  });

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  late Future<List<Ayat>> _ayatFuture;

  @override
  void initState() {
    super.initState();
    _ayatFuture = fetchAyat();
  }

  // 🔹 Ambil data ayat dari API
  Future<List<Ayat>> fetchAyat() async {
    final arabUri = Uri.parse(
        'https://api.alquran.cloud/v1/surah/${widget.surahNumber}/quran-uthmani');
    final idUri = Uri.parse(
        'https://api.alquran.cloud/v1/surah/${widget.surahNumber}/id.indonesian');

    final arabRes = await http.get(arabUri);
    final idRes = await http.get(idUri);

    if (arabRes.statusCode != 200 || idRes.statusCode != 200) {
      throw Exception('Gagal memuat ayat');
    }

    final arabData = json.decode(arabRes.body)['data']['ayahs'];
    final idData = json.decode(idRes.body)['data']['ayahs'];

    List<Ayat> ayatList = [];
    for (int i = 0; i < arabData.length; i++) {
      ayatList.add(Ayat(
        numberInSurah: arabData[i]['numberInSurah'] ?? 0,
        text: arabData[i]['text'] ?? '',
        translation: idData[i]['text'] ?? '',
      ));
    }
    return ayatList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E8A57),
        title: Text('${widget.surahLatin} (${widget.surahName})'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Ayat>>(
        future: _ayatFuture,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final list = snap.data ?? [];
          if (list.isEmpty) {
            return const Center(child: Text('Tidak ada ayat ditemukan.'));
          }

          // 📜 Tampilkan list ayat + terjemahan
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            itemBuilder: (context, i) {
              final ayat = list[i];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Ayat dalam bahasa Arab
                    Text(
                      ayat.text,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'Scheherazade',
                        color: Color(0xFF1B5E3F),
                        height: 1.8,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    // Terjemahan Indonesia
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${ayat.numberInSurah}. ${ayat.translation}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
