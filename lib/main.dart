import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'login/login_page.dart';
import 'utama/home_page.dart';
import 'setting/setting_page.dart';
import 'doaharian/doa_harian_page.dart';
import 'jadwalsholat/jadwal_sholat_page.dart';
import 'niatpuasa/niat_puasa_page.dart';
import 'dzikirharian/dzikir_pagi_page.dart';
import 'arahkiblat/arah_kiblat_page.dart';
import 'hadist/hadist_arbain_page.dart';
import 'alquran/alquran_page.dart';
import 'niatsholat/niat_sholat_page.dart';
import 'bacaansholat/bacaan_sholat_page.dart';
import 'niatwudhu/niat_wudhu_page.dart';
import 'ceritanabi/kisah_para_nabi_page.dart';

// MODEL STATE
class AppSettings extends ChangeNotifier {
  bool isDarkMode = false;
  String selectedLanguage = 'Indonesia';

  void toggleDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void changeLanguage(String lang) {
    selectedLanguage = lang;
    notifyListeners();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Iman',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: settings.isDarkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      locale: settings.selectedLanguage == 'Indonesia'
          ? const Locale('id', 'ID')
          : const Locale('en', 'US'),
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/doaHarian': (context) => const DoaHarianPage(),
        '/jadwalSholat': (context) => const JadwalSholatPage(),
        '/niatPuasa': (context) => const NiatPuasaPage(),
        '/dzikirPagi': (context) => const DzikirPagiPage(),
        '/arahKiblat': (context) => const ArahKiblatPage(),
        '/hadistArbain': (context) => const HadistArbainPage(),
        '/alquran': (context) => const AlquranPage(),
        '/niatSholat': (context) => const NiatSholatPage(),
        '/bacaanSholat': (context) => const BacaanSholatPage(),
        '/niatWudhu': (context) => const NiatWudhuPage(),
        '/kisahParaNabi': (context) => const KisahParaNabiPage(),
        '/setting': (context) => const SettingPage(),
      },
    );
  }
}
