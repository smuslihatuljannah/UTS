import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login/login_page.dart';
import '../main.dart'; // untuk AppSettings

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: const Color.fromARGB(255, 103, 151, 105),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Mode Gelap'),
            value: settings.isDarkMode,
            onChanged: (value) {
              settings.toggleDarkMode(value);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    value
                        ? 'Mode Gelap diaktifkan 🌙'
                        : 'Mode Terang diaktifkan ☀️',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Bahasa'),
            subtitle: Text(settings.selectedLanguage),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showLanguageDialog(context, settings),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Aplikasi Iman',
                applicationVersion: '1.0.0',
                applicationLegalese:
                    'Dikembangkan oleh Siti Muslihatul Jannah — UIN Malang 💚',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Keluar'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, AppSettings settings) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pilih Bahasa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('Indonesia'),
                value: 'Indonesia',
                groupValue: settings.selectedLanguage,
                onChanged: (value) {
                  settings.changeLanguage(value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('English'),
                value: 'English',
                groupValue: settings.selectedLanguage,
                onChanged: (value) {
                  settings.changeLanguage(value!);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
