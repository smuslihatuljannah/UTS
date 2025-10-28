import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

class TasbihPage extends StatefulWidget {
  final String dzikirLatin;
  final String dzikirArab;

  const TasbihPage({
    super.key,
    required this.dzikirLatin,
    required this.dzikirArab,
  });

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  int count = 0;

  // 🔊 Gunakan player baru untuk tiap klik biar tidak error
  Future<void> _playClickSound() async {
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('icon/click.mp3'));
    } catch (e) {
      debugPrint("❌ Gagal memutar suara: $e");
    }
  }

  void _increment() async {
    if (count >= 33) return;

    setState(() {
      count++;
    });

    await _playClickSound(); 

    // 📳 Jika sudah 33 kali
    if (count == 33) {
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(duration: 600);
      }

      // 🎉 Dialog notif
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Dzikir selesai!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Kamu telah menyelesaikan 33 kali dzikir.',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              // 🔹 Tombol navigasi atas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.black87,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      color: Colors.black87,
                      onPressed: _reset,
                    ),
                  ],
                ),
              ),

              // 🔹 Isi utama
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 🌙 Ornamen kaligrafi transparan
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/icon/ornamen.png',
                          width: 280,
                          height: 280,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // 📿 Tasbih bisa diklik (posisi agak ke atas)
                      Positioned(
                        top: 70,
                        child: GestureDetector(
                          onTap: _increment,
                          child: Image.asset(
                            'assets/icon/tasbih.png',
                            width: 230,
                            height: 230,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // ☪️ Lafadz Arab di dalam tasbih
                      Positioned(
                        top: 160,
                        child: Text(
                          widget.dzikirArab,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Scheherazade',
                            fontSize: 24,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🔹 Counter angka
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF4E7F68),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
