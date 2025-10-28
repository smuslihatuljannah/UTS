import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/feature_card.dart';
import '../main.dart'; // ambil AppSettings

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allFeatures = [
    {'title': 'Do’a Harian', 'iconPath': 'assets/icon/doaharian.png', 'route': '/doaHarian'},
    {'title': 'Jadwal Sholat', 'iconPath': 'assets/icon/jadwalsholat.png', 'route': '/jadwalSholat'},
    {'title': 'Dzikir Pagi', 'iconPath': 'assets/icon/dzikirpagi.png', 'route': '/dzikirPagi'},
    {'title': 'Arah Kiblat', 'iconPath': 'assets/icon/arahkiblat.png', 'route': '/arahKiblat'},
    {'title': 'Hadist', 'iconPath': 'assets/icon/ceritanabi2.png', 'route': '/hadistArbain'},
  ];

  List<Map<String, dynamic>> filteredFeatures = [];

  @override
  void initState() {
    super.initState();
    filteredFeatures = allFeatures;
  }

  void _searchFeatures() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredFeatures = allFeatures;
      } else {
        filteredFeatures = allFeatures
            .where((feature) => feature['title'].toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data setting (mode gelap dan bahasa)
    final settings = Provider.of<AppSettings>(context);

    // Terjemahan teks berdasarkan bahasa yang dipilih
    final bool isEnglish = settings.selectedLanguage == 'English';
    final Color textColor = settings.isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor:
          settings.isDarkMode ? Colors.grey[900] : const Color.fromARGB(255, 207, 215, 207),
      appBar: AppBar(
        backgroundColor:
            settings.isDarkMode ? Colors.grey[850] : const Color.fromARGB(255, 103, 151, 105),
        title: Text(
          'Aplikasi Iman',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/setting'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEnglish ? 'Peace be upon you' : 'Assalamu‘alaikum',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                isEnglish
                    ? 'Increase your faith and good deeds today!'
                    : 'Tingkatkan iman dan amalan hari ini!',
                style: TextStyle(color: settings.isDarkMode ? Colors.white70 : Colors.black54),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: settings.isDarkMode
                      ? Colors.teal[700]
                      : const Color.fromARGB(255, 103, 151, 105),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  isEnglish
                      ? '🌟 Have you prayed today?\nMake your life more meaningful by remembering Allah every moment.'
                      : '🌟 Sudahkah kamu berdoa hari ini?\nJadikan hidupmu lebih bermakna dengan mengingat Allah di setiap waktu.',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: isEnglish ? 'Search Islamic features...' : 'Cari fitur islami...',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (_) => _searchFeatures(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _searchFeatures,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 166, 132),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                isEnglish ? 'Daily Practices' : 'Amalan Harian',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FeatureCard(
                      title: isEnglish ? 'Prayer Intentions' : 'Niat Sholat',
                      iconPath: 'assets/icon/niatsholat.png',
                      isHorizontal: true,
                      onTap: () => Navigator.pushNamed(context, '/niatSholat'),
                    ),
                    FeatureCard(
                      title: isEnglish ? 'Prayer Readings' : 'Bacaan Sholat',
                      iconPath: 'assets/icon/bacaansholat.png',
                      isHorizontal: true,
                      onTap: () => Navigator.pushNamed(context, '/bacaanSholat'),
                    ),
                    FeatureCard(
                      title: isEnglish ? 'Prophet Stories' : 'Cerita Nabi',
                      iconPath: 'assets/icon/ceritanabi.png',
                      isHorizontal: true,
                      onTap: () => Navigator.pushNamed(context, '/kisahParaNabi'),
                    ),
                    FeatureCard(
                      title: isEnglish ? 'Fasting Intentions' : 'Niat Puasa',
                      iconPath: 'assets/icon/niatpuasa.png',
                      isHorizontal: true,
                      onTap: () => Navigator.pushNamed(context, '/niatPuasa'),
                    ),
                    FeatureCard(
                      title: isEnglish ? 'Wudu Intentions' : 'Niat Wudhu',
                      iconPath: 'assets/icon/niatwudhu.png',
                      isHorizontal: true,
                      onTap: () => Navigator.pushNamed(context, '/niatWudhu'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Text(
                isEnglish ? 'Islamic Features' : 'Fitur Islami',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: SingleChildScrollView(
                  child: filteredFeatures.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              isEnglish
                                  ? 'No features found 😔'
                                  : 'Fitur tidak ditemukan 😔',
                              style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7)),
                            ),
                          ),
                        )
                      : GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: filteredFeatures
                              .map(
                                (feature) => FeatureCard(
                                  title: feature['title'],
                                  iconPath: feature['iconPath'],
                                  onTap: feature['route'] != null
                                      ? () => Navigator.pushNamed(context, feature['route'])
                                      : null,
                                ),
                              )
                              .toList(),
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
