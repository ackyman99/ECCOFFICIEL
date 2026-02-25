import 'package:eccofficiel/theme.dart';
import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/screens/login_screen.dart';
import 'package:eccofficiel/screens/Histoire/histoireFondation.dart';
import 'package:eccofficiel/screens/Doctrine/doctrineetformeculte.dart';
import 'package:eccofficiel/screens/Ordre/ordreculte.dart';
import 'package:eccofficiel/screens/Administration/administration.dart';
import 'package:eccofficiel/screens/Evenement/evenementeglise.dart';
import 'package:eccofficiel/screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:eccofficiel/core/theme_controller.dart';

class Navbar extends StatelessWidget {
  final BibleRepository repo;
  const Navbar({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final themeCtrl = context.watch<ThemeController>();
    final mode = themeCtrl.themeMode;
    return Drawer(
      elevation: 16,
      shape: const Border(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Dorgeles Ackyman"),
            accountEmail: const Text('dorgelesackyman@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 100,
              child: ClipOval(child: Image.asset('assets/images/background2.png', gaplessPlayback: true)),
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/backgroundProfil.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
            child: Text(
              'Navigation',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: _settingItem(context,
              icon: Iconsax.home,
              title: 'Accueil',
            ),
          ),

          
           GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfilePage(),
                ),
              );
            },
            child: _settingItem(context,
              icon: Iconsax.user,
              title: 'Profil',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoireFondationPage(),
                ),
              );
            },
            child: _settingItem(context,
              icon: Iconsax.document,
              title: 'Histoire de la Fondation',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DoctrineEtFormeCultePage(),
                ),
              );
            },
            child: _settingItem(context,
              icon: Iconsax.book,
              title: 'Doctrine et forme du culte',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const OrdreCultePage(),
                ),
              );
            },
            child: _settingItem(context,
              icon: Iconsax.book_saved,
              title: 'Ordre du culte',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AdministrationPage(),
                ),
              );
            },
            child: _settingItem(context,
              icon: Iconsax.document_text,
              title: 'Administration',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EvenementEglisePage(),
                ),
              );
            },
            child: _settingItem(context,
              icon: Iconsax.calendar_1,
              title: 'Événements de l’Église',
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
            child: Text(
              'Réglages',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_auto_outlined),
            title: const Text('Apparence'),
            subtitle: Text(
              switch (mode) {
                ThemeMode.light => 'Jour',
                ThemeMode.dark => 'Nuit',
                ThemeMode.system => 'Système',
              },
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: PopupMenuButton<ThemeMode>(
              icon: const Icon(Iconsax.arrow_down_1),
              onSelected: (m) => themeCtrl.setThemeMode(m),
              itemBuilder: (ctx) => [
                const PopupMenuItem(value: ThemeMode.system, child: Text('Système')),
                const PopupMenuItem(value: ThemeMode.light, child: Text('Jour')),
                const PopupMenuItem(value: ThemeMode.dark, child: Text('Nuit')),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
            title: Text('Déconnexion', style: TextStyle(color: Theme.of(context).colorScheme.error)),
            onTap: () async {
              Navigator.pop(context);
              await Future.delayed(const Duration(milliseconds: 120));
              // Réinitialise la navigation et revient à l'écran de connexion
              // en conservant l'instance de repository.
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => LoginScreen(repo: repo)),
                (route) => false,
              );
            },
          ),

        ],
      ),
    );
  }

    static Widget _settingItem(BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    final cs = Theme.of(context).colorScheme;
    final bg = cs.surface;
    final icoBg = cs.primary.withOpacity(0.12);
    final ico = cs.primary;
    final txt = cs.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: icoBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: ico),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),

              ],
            ),
          ),
          Icon(
            Iconsax.arrow_circle_right5,
            size: 20,
            color: txt,
          ),
        ],
      ),
    );
  }
}
