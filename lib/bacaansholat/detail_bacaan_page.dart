import 'package:flutter/material.dart';

class DetailBacaanPage extends StatelessWidget {
  final String judul;
  final String keyData;
  const DetailBacaanPage({super.key, required this.judul, required this.keyData});

  Map<String, Map<String, String>> get dataBacaan => {
    'iftitah': {
      'arab': 'اللهُ أَكْبَرُ كَبِيْراً وَالْحَمْدُ لِلَّهِ كَثِيْراً وَسُبْحَانَ اللهِ بُكْرَةً وَأَصِيْلًا  . اِنِّى وَجَّهْتُ وَجْهِيَ لِلَّذِيْ فَطَرَالسَّمَاوَاتِ وَالْااَرْضَ حَنِيْفًا مُسْلِمًا وَمَا اَنَا مِنَ الْمُشْرِكِيْنَ . اِنَّ صَلَاتِيْ وَنُسُكِيْ وَمَحْيَايَ وَمَمَاتِيْ لِلهِ رَبِّ الْعَا لَمِيْنَ . لاَ شَرِيْكَ لَهُ وَبِذَ لِكَ اُمِرْتُ وَاَنَ مِنَ الْمُسْلِمِيْنَ',
      'latin': 'Allaahu akbar Kabiroo Walhamdulillaahi Katsiiraa, Wa Subhaanallaahi Bukratan Wa’ashiilaa, Innii Wajjahtu Wajhiya Lilladzii Fatharas Samaawaati Wal Ardha Haniifan Musliman Wamaa Anaa Minal Musyrikiin. Inna Shalaatii Wa Nusukii Wa Mahyaaya Wa Mamaatii Lillaahi Rabbil ‘Aalamiina. Laa Syariikalahu Wa Bidzaalika Umirtu Wa Ana Minal Muslimiin',
      'arti': 'Allah maha besar, maha sempurna kebesaran-Nya. Segala puji bagi Allah, pujian yang sebanyak-banyaknya. Dan maha suci Allah sepanjang pagi dan petang. Kuhadapkan wajahku kepada zat yang telah menciptakan langit dan bumi dengan penuh ketulusan dan kepasrahan dan aku bukanlah termasuk orang-orang yang musyrik. Sesungguhnya sholatku, ibadahku, hidupku dan matiku semuanya untuk Allah, penguasa alam semesta. Tidak ada sekutu bagi-Nya dan dengan demikianlah aku diperintahkan dan aku termasuk orang-orang yang muslim.'
    },
    'fatihah': {
      'arab': 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
      'latin': 'Bismillahirrahmanirrahim ... wa lad-dhaalliin.',
      'arti': 'Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang ...'
    },
    'rukuk': {
      'arab': 'سُبْحَانَ رَبِّىَ الْعَظِيْمِ وَبِحَمْدِهِ',
      'latin': 'Subhaana rabbiyal adhiimi wa bihamdih.',
      'arti': 'Mahasuci Tuhanku Yang Maha Agung dan Maha Terpuji.'
    },
    'itidal': {
      'arab': 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ ... رَبَّنَا لَكَ الْحَمْدُ مِلْءَ السَّمَوَاتِ وَمِلْءَ الْأَرْضِ وَمِلْءَ مَا شِئْتَ مِنْ شَيْءٍ بَعْدُ',
      'latin': 'Sami’allahu liman hamidah ... Rabbanaaa lakal hamdu mil-ussamaawaati wa mil-ul-ardhi wa mil-u maa syik-ta min syai-im ba’du.',
      'arti': 'Allah mendengar orang yang memuji-Nya ...Ya Allah Tuhan Kami, Bagi-Mu lah segala puji, sepenuh langit dan bumi, dan sepenuh barang yang Kau kehendaki sesudah itu.'
    },
    'sujud': {
      'arab': 'سُبْحَانَ رَبِّىَ الأَعْلَى وَبِحَمْدِهِ',
      'latin': 'Subhaana rabbiyal a’laa wa bihamdih.',
      'arti': 'Mahasuci Tuhanku Yang Mahatinggi dan Maha Terpuji.'
    },
    'duduk': {
      'arab': 'رَبِّ اغْفِرْلِىْ وَارْحَمْنِىْ وَاجْبُرْنِىْ وَارْفَعْنِىْ وَازُقْنِىْ وَاهْدِنِىٌ وَعَا فِنِىْ وَاعْفُ عَنِّىْ',
      'latin': 'Rabighfirlii, Warhamnii, Wajburnii, Warfa’ni, Warzuqnii, Wahdini, Wa’aafinii, Wa’fuannii',
      'arti': 'Ya Allah, ampunilah dosaku, rahmatilah aku, perbaikilah aku, berikanlah aku rezeki dan angkatlah derajatku.',
    },
    'tasyahhud_awal': {
      'arab': 'التَّحِيَّاتُ الْمُبَارَكَاتُ الصَّلَوَاتُ الطَّيِّبَاتُ لِلَّهِ السَّلَامُ عَلَيْك أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ, أَشْهَدُ أَنْ لَا إلَهَ إلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللهِ, اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ',
      'latin': 'Attahiyyaatul mubaarakaatush shalawaatuth thoyyibaatulillaah Assalaamualaika ayyuhan nabiyyu warahmatullaahi wabarakaatuh, Assalaamualaina waalaa ibaadillaahishaalihiin. Asyhaduallaa ilaaha illallaah, wa asyhadu anna Muhammad Rasuulullaah Allahumma shalli alaa sayyidinaa muhammad.',
      'arti': 'Segala kehormatan, dan keberkahan, kebahagiaan dan kebaikan itu punya Allah. Keselamatan atas Nabi Muhammad, juga rahmat dan berkahnya. Keselamatan dicurahkan kepada kami dan atas seluruh hamba Allah yang sholeh. Aku bersaksi tidak ada sesembahan yang berhak disembah kecuali Allah. Dan aku bersaksi bahwa Nabi Muhammad adalah utusan Allah. Ya Allah, limpahkanlah rahmat kepada Nabi Muhammad.',
    },
    'tasyahhud_akhir': {
      'arab': '‎وَعَلَى آلِ مُحَمَّدٍ، كَمَا صَلَّيْتَ عَلٰى سَيِّدِ نَا إِبْرَاهِيمَ وَعَلٰى آلِ سَيِّدِ نَا إِبْرَاهِيمَ، وَ بَارِكْ عَلٰى مُحَمَّدٍ  وَعَلَى آلِ  سَيِّدِ نَا مُحَمَّدٍ كَمَا بَارَكْتَ عَلٰى سَيِّدِ نَا إِبْرَاهِيمَ ، وَعَلٰى آلِ  سَيِّدِ نَا إِبْرَاهِيمَ،  فِى الْعَا لَمِيْنَ إِنَّكَ حَمِيدٌ مَجِيدٌ ',
      'latin': 'Wa alaa aali sayyidina muhammad. Kamaa shallaita alaa sayyidinaa Ibraahim waalaa aali sayyidinaa ibraahim wabaarik alaa sayyidinaa muhammad wa alaa aali sayyidina muhammad. Kamaa baarakta alaa sayyidinaa ibraahiim wa alaa aali sayyidina Ibraahiim filaalamiina innaka hamiidum majiid.',
      'arti': 'Ya Allah. Limpahilah rahmat atas keluarga Nabi Muhammad. Sebagaimana pernah Engkau beri rahmat kepada Nabi Ibrahim dan keluarganya. Dan limpahilah berkah atas Nabi Muhammad beserta para keluarganya. Sebagaimana Engkau memberi berkah kepada Nabi Ibrahim dan keluarganya. Diseluruh alam semesta Engkaulah yang terpuji, dan Maha Mulia',
    },
    'salam': {
      'arab': 'السَّلاَمُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      'latin': 'Assalaamu’alaikum wa rahmatullaah.',
      'arti': 'Semoga keselamatan dan rahmat Allah dilimpahkan kepadamu.'
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = dataBacaan[keyData]!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F9F1),
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        elevation: 0,
        title: Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFD6F5E3), Color(0xFFE9FAF0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data['arab']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontFamily: 'Scheherazade',
                  height: 2,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                data['latin']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                data['arti']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
