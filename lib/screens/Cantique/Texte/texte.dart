import 'dart:async';
import 'package:eccofficiel/screens/Cantique/Texte/cantique_screen_detail.dart';
import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../models/cantique.dart';
import 'cantique_service.dart';

// ignore: camel_case_types
class texte extends StatefulWidget {
  const texte({super.key});

  @override
  State<texte> createState() => _texteState();
}

// ignore: camel_case_types
class _texteState extends State<texte> {
  List<Cantique> _all = [];
  List<Cantique> _filtered = [];
  Timer? _debounce;
  late final AssetImage _iconImage;

  @override
  void initState() {
    super.initState();
    _load();
    _iconImage = const AssetImage('assets/images/musique.png');
  }

  void _load() async {
    _all = await CantiqueService.loadCantiques();
    setState(() => _filtered = _all);
  }

  void _search(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      final q = value.toLowerCase();
      setState(() {
        _filtered = _all.where((c) {
          return c.titre.toLowerCase().contains(q) ||
              c.numero.toString().contains(value);
        }).toList();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_iconImage, context);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: _search,
              decoration: InputDecoration(
                hintText: "Rechercher un cantique...",
                prefixIcon: const Icon(Iconsax.search_normal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (context, index) {
                final cantique = _filtered[index];
                return GestureDetector(
          onTap: () {
            Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CantiqueDetailScreen(cantique: cantique),
                        ),
                      );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                    offset: const Offset(0, 1))
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: _iconImage,
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: 30,
                  width: 1.0,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          children: [
                            Text(
                              cantique.titre,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ]),
                      Text("Cantique n° ${cantique.numero}"),
                      Text(
                        cantique.typee,
                        style: TextStyle(
                          color: textGrey,
                          fontSize: 12,
                        ),
                      ),

                    ],
                  ),
                ),
                Icon(
                  Iconsax.arrow_circle_right5,
                  size: 20,
                  color: orange,
                )
              ],
            ),
          ),
        );
  
              },
            ),

          ),
        ],
      ),
    );
  }
}
