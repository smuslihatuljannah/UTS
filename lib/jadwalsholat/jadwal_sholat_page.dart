import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class JadwalSholatPage extends StatefulWidget {
  const JadwalSholatPage({super.key});

  @override
  State<JadwalSholatPage> createState() => _JadwalSholatPageState();
}

class _JadwalSholatPageState extends State<JadwalSholatPage> {
  late Timer _timer;
  DateTime currentTime = DateTime.now();

  final Map<String, String> jadwalSholat = {
    'Subuh': '03:45',
    'Dhuhur': '11:14',
    '‘Asar': '14:23',
    'Maghrib': '17:24',
    'Isya': '18:30',
  };

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getNextPrayer() {
    final format = DateFormat("HH:mm");
    final now = DateTime.now();

    final sorted = jadwalSholat.entries.map((e) {
      final t = format.parse(e.value);
      return MapEntry(
        e.key,
        DateTime(now.year, now.month, now.day, t.hour, t.minute),
      );
    }).toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    for (var e in sorted) {
      if (e.value.isAfter(now)) return e.key;
    }
    return sorted.first.key;
  }

  String getNextPrayerTime() {
    final format = DateFormat("HH:mm");
    final now = DateTime.now();

    final sorted = jadwalSholat.entries.map((e) {
      final t = format.parse(e.value);
      return MapEntry(
        e.key,
        DateTime(now.year, now.month, now.day, t.hour, t.minute),
      );
    }).toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    DateTime? nextTime;
    for (var e in sorted) {
      if (e.value.isAfter(now)) {
        nextTime = e.value;
        break;
      }
    }

    nextTime ??= sorted.first.value.add(const Duration(days: 1));

    final diff = nextTime.difference(now);
    final h = diff.inHours;
    final m = diff.inMinutes % 60;

    return "$h jam $m menit lagi";
  }

  IconData getPrayerIcon(String name) {
    switch (name) {
      case 'Subuh':
        return Icons.nightlight_round;
      case 'Dhuhur':
        return Icons.wb_sunny;
      case '‘Asar':
        return Icons.location_city;
      case 'Maghrib':
        return Icons.sunny;
      case 'Isya':
        return Icons.nights_stay;
      default:
        return Icons.access_time;
    }
  }

  @override
  Widget build(BuildContext context) {
    String nextPrayer = getNextPrayer();
    String nextPrayerTime = getNextPrayerTime();
    String currentTimeFormatted = DateFormat("HH.mm.ss").format(currentTime);
    String currentDate = DateFormat("EEEE, dd MMMM yyyy", 'id_ID').format(currentTime);

    return Scaffold(
      backgroundColor: const Color(0xFFEFF7F1),
      // ✅ Tambahkan tombol kembali di AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF5AA96C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // kembali ke halaman sebelumnya (HomePage)
          },
        ),
        title: const Text(
          "Jadwal Sholat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // HEADER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5AA96C),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_on, color: Colors.white70, size: 18),
                          SizedBox(width: 4),
                          Text(
                            "Malang, Indonesia",
                            style: TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentTimeFormatted,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.white70, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            currentDate,
                            style: const TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // CARD SHOLAT SELANJUTNYA
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECFFF3),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Sholat Selanjutnya",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  jadwalSholat[nextPrayer] ?? "",
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  nextPrayer,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  nextPrayerTime,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
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

                const SizedBox(height: 22),

                Row(
                  children: const [
                    Icon(Icons.access_time, color: Colors.green),
                    SizedBox(width: 6),
                    Text(
                      "Jadwal Sholat Hari Ini",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // LIST SHOLAT
                ...jadwalSholat.entries.map((entry) {
                  bool isNext = entry.key == nextPrayer;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isNext ? const Color(0xFFDFF4E4) : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE7F6E9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            getPrayerIcon(entry.key),
                            color: Colors.orange.shade700,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.key,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              Text(
                                isNext ? "Waktu sholat berikutnya" : "Sudah berlalu",
                                style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          entry.value.replaceAll(":", "."),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isNext ? Colors.green.shade900 : Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
