import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:eccofficiel/models/ordre_culte.dart';

class OrdreService {
  static const String assetPath = 'assets/data/ordreculte_reorganise.json';

  static Future<OrdreCulte> load() async {
    final raw = await rootBundle.loadString(assetPath);
    final map = json.decode(raw) as Map<String, dynamic>;
    return OrdreCulte.fromJson(map);
  }
}
