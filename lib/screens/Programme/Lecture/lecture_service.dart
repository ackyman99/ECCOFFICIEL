import 'dart:convert';
import 'package:eccofficiel/models/lecture.dart';
import 'package:flutter/services.dart';

class LectureService {
  static Future<List<Lecture>> loadLectures() async {
    final String response =
        await rootBundle.loadString('assets/data/lectures.json');
    final List data = json.decode(response);
    return data.map((e) => Lecture.fromJson(e)).toList();
  }
}
