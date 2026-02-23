import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:eccofficiel/models/administration.dart';

class AdministrationService {
  static const String assetPath = 'assets/data/administration_reorganise.json';

  static Future<Administration> load() async {
    final raw = await rootBundle.loadString(assetPath);
    final map = json.decode(raw) as Map<String, dynamic>;
    return Administration.fromJson(map);
    }
}
