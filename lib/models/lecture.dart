class Lecture {
  final String plecture;
  final String dlecture;
  final String titrep;
  final String titred;
  final String contenup;
  final String contenud;
  // final String icon;
  final String date;

  Lecture({
    required this.plecture,
    required this.dlecture,
    required this.titrep,
    required this.titred,
    required this.contenup,
    required this.contenud,
    // required this.icon,
    required this.date,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      plecture : json ['plecture'],
      dlecture: json['dlecture'],
      titrep: json['titrep'],
      titred: json['titred'],
      contenup: json['contenup'],
      contenud: json['contenud'],
      // icon: json['icon'],
      date : json['date'],
    );
  }
}
