import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eccofficiel/theme.dart';
import 'package:provider/provider.dart';
import 'package:eccofficiel/core/theme_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.blueGrey.shade100,
                  child: const Icon(Iconsax.user, size: 44, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Utilisateur ECC',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  'Membre',
                  style: TextStyle(color: textGrey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Iconsax.user_edit),
                  title: Text('Nom complet'),
                  subtitle: Text('Votre nom'),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Iconsax.sms),
                  title: Text('Email'),
                  subtitle: Text('votre.email@exemple.com'),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Iconsax.call),
                  title: Text('Téléphone'),
                  subtitle: Text('+00 00 00 00 00'),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Iconsax.building_4),
                  title: Text('Paroisse'),
                  subtitle: Text('Votre paroisse'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Iconsax.setting_2),
                  title: const Text('Paramètres'),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      builder: (ctx) {
                        final ctrl = ctx.read<ThemeController>();
                        ThemeMode current = ctx.watch<ThemeController>().themeMode;
                        void select(ThemeMode mode) {
                          ctrl.setThemeMode(mode);
                          Navigator.pop(ctx);
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Apparence',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ),
                              RadioListTile<ThemeMode>(
                                value: ThemeMode.system,
                                groupValue: current,
                                onChanged: (_) => select(ThemeMode.system),
                                title: const Text('Système'),
                                secondary: const Icon(Icons.brightness_auto_outlined),
                              ),
                              RadioListTile<ThemeMode>(
                                value: ThemeMode.light,
                                groupValue: current,
                                onChanged: (_) => select(ThemeMode.light),
                                title: const Text('Jour'),
                                secondary: const Icon(Icons.light_mode_outlined),
                              ),
                              RadioListTile<ThemeMode>(
                                value: ThemeMode.dark,
                                groupValue: current,
                                onChanged: (_) => select(ThemeMode.dark),
                                title: const Text('Nuit'),
                                secondary: const Icon(Icons.dark_mode_outlined),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Iconsax.info_circle),
                  title: const Text('À propos'),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
