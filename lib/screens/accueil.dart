// ignore: file_names
import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/bible/books_screen.dart';
import 'package:eccofficiel/core/drawer.dart';
import 'package:eccofficiel/screens/Accueil/home.dart';
import 'package:eccofficiel/screens/Cantique/Cantique.dart';
import 'package:eccofficiel/screens/Programme/programme.dart';
import 'package:eccofficiel/screens/navBar.dart';
import 'package:eccofficiel/theme.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key, required this.repo});
   final BibleRepository repo;


  @override
  // ignore: library_private_types_in_public_api
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int _selectedIndex = 0;

  List<Widget> get tabItems => [
    const Home(),
    const cantique(),
    BooksScreen(repo: widget.repo,),
    const Programme(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(repo: widget.repo),
      appBar: appBar(),
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        height: 55,
        backgroundColor: Theme.of(context).colorScheme.surface,
        shadows: [
          BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.10),
              spreadRadius: 0.0,
              blurRadius: 20.0,
              offset: const Offset(0, 4))
        ],
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            activeColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Iconsax.home, size: 25),
            title: const Text(
              'Accueil',
              style: TextStyle(fontSize: 10),
            ),
          ),
          FlashyTabBarItem(
            activeColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Iconsax.activity, size: 25),
            title: const Text(
              'Cantique',
              style: TextStyle(fontSize: 10),
            ),
          ),
          FlashyTabBarItem(
            activeColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Iconsax.document, size: 25),
            title: const Text(
              'Bible',
              style: TextStyle(fontSize: 10),
            ),
          ),
          FlashyTabBarItem(
            activeColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Iconsax.empty_wallet_tick, size: 25),
            title: const Text(
              'Programme',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
