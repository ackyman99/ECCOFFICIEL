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
  String _query = '';
  String? _selectedType;
  final List<String> _types = [];

  @override
  void initState() {
    super.initState();
    _load();
    _iconImage = const AssetImage('assets/images/musique.png');
  }

  void _load() async {
    _all = await CantiqueService.loadCantiques();
    setState(() {
      _buildTypes();
      _filtered = _all;
    });
  }

  void _search(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      _query = value;
      _applyFilters();
    });
  }

  void _buildTypes() {
    final seen = <String>{};
    _types.clear();
    for (final c in _all) {
      final t = c.type.trim();
      if (seen.add(t)) {
        _types.add(t);
      }
    }
    _types.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }

  void _applyFilters() {
    final q = _query.toLowerCase();
    final selected = _selectedType;
    setState(() {
      _filtered = _all.where((c) {
        final matchesQuery = q.isEmpty
            ? true
            : c.titre.toLowerCase().contains(q) ||
                c.numero.toString().contains(_query) ||
                c.type.toLowerCase().contains(q) ||
                c.reference.toLowerCase().contains(q);
        final matchesType =
            selected == null ? true : c.type.trim() == selected;
        return matchesQuery && matchesType;
      }).toList();
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
          SizedBox(
            height: 44,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: const Text('Tous'),
                      selected: _selectedType == null,
                      selectedColor: Theme.of(context).colorScheme.primary,
                      labelStyle: TextStyle(
                        color: _selectedType == null
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                      onSelected: (sel) {
                        _selectedType = null;
                        _applyFilters();
                      },
                    ),
                  ),
                  for (final t in _types)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(t),
                        selected: _selectedType == t,
                        selectedColor: Theme.of(context).colorScheme.primary,
                        labelStyle: TextStyle(
                          color: _selectedType == t
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                        onSelected: (sel) {
                          _selectedType = sel ? t : null;
                          _applyFilters();
                        },
                      ),
                    ),
                ],
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
                        builder: (_) => CantiqueDetailScreen(cantique: cantique),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: _iconImage, fit: BoxFit.cover),
                          ),
                        ),
                          Container(
                            height: 30,
                            width: 1.0,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    cantique.titre,
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                if (cantique.mp3.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Icon(Icons.audiotrack, size: 14, color: Theme.of(context).colorScheme.primary),
                                  ),
                              ]),
                              Text("Cantique n° ${cantique.numero}${cantique.reference.isNotEmpty ? ' - ${cantique.reference}' : ''}"),
                              Text(
                                cantique.type.trim(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Iconsax.arrow_circle_right5,
                          size: 20,
                            color: Theme.of(context).colorScheme.primary,
                        )
                      ],
                      ),
                    ),
                  ),
                );
              },
            ),

          ),
        ],
      ),
    );
}}
