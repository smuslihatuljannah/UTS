import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail_surah_page.dart';

class AlquranPage extends StatefulWidget {
  const AlquranPage({super.key});

  @override
  State<AlquranPage> createState() => _AlquranPageState();
}

class _AlquranPageState extends State<AlquranPage> {
  late Future<List<SurahInfo>> _surahFuture;
  List<SurahInfo> _allSurah = [];
  List<SurahInfo> _filteredSurah = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _surahFuture = fetchSurahList();
  }

  Future<List<SurahInfo>> fetchSurahList() async {
    try {
      final uri = Uri.parse('https://api.alquran.cloud/v1/surah');
      final res = await http.get(uri);

      if (res.statusCode != 200) {
        throw Exception('Gagal mengambil data surah: ${res.statusCode}');
      }

      final jsonBody = json.decode(res.body);
      if (jsonBody == null || jsonBody['data'] == null || jsonBody['data'] is! List) {
        throw Exception('Format data tidak sesuai');
      }

      final List data = jsonBody['data'];
      final list = data.map((e) => SurahInfo.fromJson(e)).toList();
      _allSurah = list;
      _filteredSurah = List<SurahInfo>.from(list);
      return list;
    } catch (e) {
      throw Exception('Terjadi kesalahan koneksi atau format data tidak sesuai: $e');
    }
  }

  // Normalisasi nama agar tampil versi Indonesia
  String normalizeName(String? name) {
    var s = (name ?? '').toString().trim();

    final replacements = {
      'Al-Faatiha': 'Al-Fatihah',
      'Al-Baqara': 'Al-Baqarah',
      'Aali Imraan': 'Ali Imran',
      'An-Nisaa': 'An-Nisa’',
      'Al-Maaida': 'Al-Ma’idah',
      'Al-An’aam': 'Al-An’am',
      'Al-A’raaf': 'Al-A’raf',
      'Al-Anfaal': 'Al-Anfal',
      'At-Tawba': 'At-Taubah',
      'Yunus': 'Yunus',
      'Hud': 'Hud',
      'Yusuf': 'Yusuf',
      'Ar-Ra’d': 'Ar-Ra’d',
      'Ibrahim': 'Ibrahim',
      'Al-Hijr': 'Al-Hijr',
      'An-Nahl': 'An-Nahl',
      'Al-Israa': 'Al-Isra’',
      'Al-Kahf': 'Al-Kahfi',
      'Maryam': 'Maryam',
      'Taa-Haa': 'Tha Ha',
      'Al-Anbiyaa': 'Al-Anbiya’',
      'Al-Hajj': 'Al-Hajj',
      'Al-Mu’minoon': 'Al-Mu’minun',
      'An-Noor': 'An-Nur',
      'Al-Furqaan': 'Al-Furqan',
      'Ash-Shu’araa': 'Asy-Syu’ara’',
      'An-Naml': 'An-Naml',
      'Al-Qasas': 'Al-Qashash',
      'Al-Ankaboot': 'Al-‘Ankabut',
      'Ar-Room': 'Ar-Rum',
      'Luqman': 'Luqman',
      'As-Sajda': 'As-Sajdah',
      'Al-Ahzaab': 'Al-Ahzab',
      'Saba': 'Saba’',
      'Faatir': 'Fatir',
      'Yaseen': 'Yasin',
      'As-Saaffaat': 'As-Saffat',
      'Saad': 'Sad',
      'Az-Zumar': 'Az-Zumar',
      'Ghaafir': 'Ghafir',
      'Fussilat': 'Fussilat',
      'Ash-Shura': 'Asy-Syura',
      'Az-Zukhruf': 'Az-Zukhruf',
      'Ad-Dukhaan': 'Ad-Dukhan',
      'Al-Jaathiya': 'Al-Jatsiyah',
      'Al-Ahqaf': 'Al-Ahqaf',
      'Muhammad': 'Muhammad',
      'Al-Fath': 'Al-Fath',
      'Al-Hujuraat': 'Al-Hujurat',
      'Qaaf': 'Qaf',
      'Adh-Dhaariyaat': 'Adz-Dzariyat',
      'At-Toor': 'At-Tur',
      'An-Najm': 'An-Najm',
      'Al-Qamar': 'Al-Qamar',
      'Ar-Rahmaan': 'Ar-Rahman',
      'Al-Waaqia': 'Al-Waqi’ah',
      'Al-Hadid': 'Al-Hadid',
      'Al-Mujaadila': 'Al-Mujadilah',
      'Al-Hashr': 'Al-Hasyr',
      'Al-Mumtahana': 'Al-Mumtahanah',
      'As-Saff': 'As-Saff',
      'Al-Jumu’a': 'Al-Jumu’ah',
      'Al-Munaafiqoon': 'Al-Munafiqun',
      'At-Taghaabun': 'At-Taghabun',
      'At-Talaaq': 'At-Talaq',
      'At-Tahrim': 'At-Tahrim',
      'Al-Mulk': 'Al-Mulk',
      'Al-Qalam': 'Al-Qalam',
      'Al-Haaqqa': 'Al-Haqqah',
      'Al-Ma’aarij': 'Al-Ma’arij',
      'Nooh': 'Nuh',
      'Al-Jinn': 'Al-Jin',
      'Al-Muzzammil': 'Al-Muzzammil',
      'Al-Muddaththir': 'Al-Muddatstsir',
      'Al-Qiyaama': 'Al-Qiyamah',
      'Al-Insaan': 'Al-Insan',
      'Al-Mursalaat': 'Al-Mursalat',
      'An-Naba': 'An-Naba’',
      'An-Naazi’aat': 'An-Nazi’at',
      'Abasa': 'Abasa',
      'At-Takwir': 'At-Takwir',
      'Al-Infitar': 'Al-Infitar',
      'Al-Mutaffifin': 'Al-Mutaffifin',
      'Al-Inshiqaaq': 'Al-Insyiqaq',
      'Al-Burooj': 'Al-Buruj',
      'At-Taariq': 'At-Tariq',
      'Al-A’laa': 'Al-A’la',
      'Al-Ghaashiya': 'Al-Ghasyiyah',
      'Al-Fajr': 'Al-Fajr',
      'Al-Balad': 'Al-Balad',
      'Ash-Shams': 'Asy-Syams',
      'Al-Lail': 'Al-Lail',
      'Adh-Dhuhaa': 'Adh-Dhuha',
      'Ash-Sharh': 'Asy-Syarh',
      'At-Tin': 'At-Tin',
      'Al-Alaq': 'Al-‘Alaq',
      'Al-Qadr': 'Al-Qadr',
      'Al-Bayyina': 'Al-Bayyinah',
      'Az-Zalzala': 'Az-Zalzalah',
      'Al-Aadiyaat': 'Al-‘Adiyat',
      'Al-Qaari’a': 'Al-Qari’ah',
      'At-Takaathur': 'At-Takatsur',
      'Al-Asr': 'Al-‘Ashr',
      'Al-Humaza': 'Al-Humazah',
      'Al-Fil': 'Al-Fil',
      'Quraish': 'Quraisy',
      'Al-Maa’oon': 'Al-Ma’un',
      'Al-Kawthar': 'Al-Kautsar',
      'Al-Kaafiroon': 'Al-Kafirun',
      'An-Nasr': 'An-Nasr',
      'Al-Masad': 'Al-Lahab',
      'Al-Ikhlaas': 'Al-Ikhlas',
      'Al-Falaq': 'Al-Falaq',
      'An-Naas': 'An-Nas',
    };

    for (final key in replacements.keys) {
      if (s.toLowerCase() == key.toLowerCase()) {
        s = replacements[key]!;
        break;
      }
    }

    return s;
  }

  String mapType(String? type) {
    final t = (type ?? '').toLowerCase();
    switch (t) {
      case 'meccan':
        return 'Mekah';
      case 'medinan':
        return 'Madinah';
      default:
        return (type ?? '').toString();
    }
  }

  void _filterSurah(String query) {
    final q = (query ?? '').toLowerCase().trim();
    setState(() {
      if (q.isEmpty) {
        _filteredSurah = List<SurahInfo>.from(_allSurah);
      } else {
        _filteredSurah = _allSurah.where((s) {
          final eng = (s.englishName ?? '').toLowerCase();
          final norm = normalizeName(s.englishName).toLowerCase();
          final arab = (s.name ?? '').toLowerCase();
          return eng.contains(q) || norm.contains(q) || arab.contains(q) || s.number.toString() == q;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF6),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: const BoxDecoration(
                color: Color(0xFF1E8A57),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 26),
                  ),
                  Expanded(
                    child: _isSearching
                        ? TextField(
                            controller: _searchController,
                            autofocus: true,
                            onChanged: _filterSurah,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Cari Surah...',
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                            ),
                          )
                        : const Center(
                            child: Text(
                              'List Surah',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSearching = !_isSearching;
                        if (!_isSearching) {
                          _searchController.clear();
                          _filteredSurah = List<SurahInfo>.from(_allSurah);
                        }
                      });
                    },
                    child: Icon(
                      _isSearching ? Icons.close : Icons.search,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<SurahInfo>>(
                future: _surahFuture,
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snap.hasError) {
                    return Center(
                      child: Text(
                        'Terjadi kesalahan:\n${snap.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    );
                  }

                  final list = _filteredSurah;

                  if (list.isEmpty) {
                    return const Center(
                      child: Text(
                        'Tidak ada data surah ditemukan.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, i) {
                        final surah = list[i];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailSurahPage(
                                  surahNumber: surah.number,
                                  surahName: surah.name,
                                  surahLatin: normalizeName(surah.englishName),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFE0E7E0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E8A57),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      surah.number.toString().padLeft(2, '0'),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        normalizeName(surah.englishName),
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1B5E3F),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${mapType(surah.revelationType)} | ${surah.numberOfAyahs} Ayat',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  surah.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Scheherazade',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1B5E3F),
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
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
    );
  }
}

class SurahInfo {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;

  SurahInfo({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory SurahInfo.fromJson(Map<String, dynamic> json) {
    return SurahInfo(
      number: json['number'] ?? 0,
      name: (json['name'] ?? '').toString(),
      englishName: (json['englishName'] ?? '').toString(),
      numberOfAyahs: json['numberOfAyahs'] ?? 0,
      revelationType: (json['revelationType'] ?? '').toString(),
    );
  }
}
