import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:eccofficiel/models/doctrine.dart';

class DoctrineService {
  static const String assetPath =
      'assets/data/doctrineetformeculte_reorganise.json';

  static Future<Doctrine> load() async {
    final raw = await rootBundle.loadString(assetPath);
    final map = json.decode(raw) as Map<String, dynamic>;
    return Doctrine.fromJson(map);
  }
}
