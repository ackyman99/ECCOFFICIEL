import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:eccofficiel/models/evenement_eglise.dart';

class EvenementService {
  static const String assetPath = 'assets/data/evenementeglise_reorganise.json';

  static Future<EgliseEvenement> load() async {
    final raw = await rootBundle.loadString(assetPath);
    final map = json.decode(raw) as Map<String, dynamic>;
    return EgliseEvenement.fromJson(map);
  }
}
