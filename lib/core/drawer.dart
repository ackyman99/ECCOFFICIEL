import 'package:eccofficiel/theme.dart';
import 'package:eccofficiel/screens/Histoire/histoireFondation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFFFFFF),
      elevation: 16,
      shape: const Border(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Dorgeles Ackyman", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            accountEmail: const Text(
              'dorgelesackyman@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
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
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: _settingItem(
              icon: Iconsax.home,
              title: 'Accueil',
            ),
          ),
           GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: _settingItem(
              icon: Iconsax.profile_circle,
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
            child: _settingItem(
              icon: Iconsax.document,
              title: 'Histoire de la Fondation',
            ),
          ),

        ],
      ),
    );
  }

    static Widget _settingItem({
    required IconData icon,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
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
 color: const Color.fromARGB(92, 57, 169, 243),              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color.fromARGB(255, 7, 131, 232)),
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
                    color: bleuclair
                  ),
                ),
                const SizedBox(height: 4),

              ],
            ),
          ),
          const Icon(
                  Iconsax.arrow_circle_right5,
                  size: 20,
                  color: bleuclair,
                ),
        ],
      ),
    );
  }
}
