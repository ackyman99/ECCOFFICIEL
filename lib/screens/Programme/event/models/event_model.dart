// class EventModel {
//   final int id;
//   final String title;
//   final DateTime date;
//   EventModel({required this.id, required this.title, required this.date});
//   factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
//         id: json['id'] as int,
//         title: json['title'] as String,
//         date: DateTime.parse(json['date'] as String),
        
//       );
// }

class EventModel {
  
  final String typee;
  final String paroisse;
  final String date;
  final String lieu;
  final DateTime expirationDate;

  EventModel({
    required this.typee,
    required this.paroisse, 
    required this.date,
    required this.lieu,
    required this.expirationDate,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      typee: json['typee'],
      paroisse: json['paroisse'],
      date: json['date'],
      lieu: json['lieu'],
      expirationDate: DateTime.parse(json['expirationDate']),
    );
  }

  Map<String, dynamic> toJson() => {
        'typee': typee,
        'paroisse': paroisse,
        'date': date,
        'lieu': lieu,
        'expirationDate': expirationDate.toIso8601String(),
      };

  bool get isExpired => expirationDate.isBefore(DateTime.now());

  int get id {
    final key = '$typee|$paroisse|$date|$lieu';
    return key.hashCode & 0x7fffffff;
  }

  String get title => '$typee - $paroisse';

  DateTime get startDate => DateTime.parse(date);
}
