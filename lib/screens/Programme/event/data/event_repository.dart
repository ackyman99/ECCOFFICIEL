import 'dart:convert';
import 'package:eccofficiel/screens/Programme/event/models/event_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class EventRepository {
  Future<List<EventModel>> fetchEvents() async {
    final data = await rootBundle.loadString('assets/data/event.json');
    final List<dynamic> list = json.decode(data) as List<dynamic>;
    final events = list
        .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final now = DateTime.now();
    events.removeWhere((e) => e.isExpired);
    return events;
  }
}
