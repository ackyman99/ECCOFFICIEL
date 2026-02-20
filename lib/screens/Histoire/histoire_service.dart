import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:eccofficiel/models/histoire_fondation.dart';

class HistoireService {
  static const String assetPath =
      'assets/data/histoireFondation_reorganise.json';

  static Future<HistoireFondation> load() async {
    final raw = await rootBundle.loadString(assetPath);
    final map = json.decode(raw) as Map<String, dynamic>;
    return HistoireFondation.fromJson(map);
  }
}
