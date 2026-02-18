import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  static Future<Map<String, dynamic>> loadBible() async {
    final jsonString =
        await rootBundle.loadString('assets/data/segond_1910.json');
    return json.decode(jsonString);
  }
}
