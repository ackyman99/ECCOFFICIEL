import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../models/cantique.dart';

class CantiqueService {
  static Future<List<Cantique>> loadCantiques() async {
    final String response =
        await rootBundle.loadString('assets/data/cantiques.json');
    final List data = json.decode(response);
    return data.map((e) => Cantique.fromJson(e)).toList();
  }
}
