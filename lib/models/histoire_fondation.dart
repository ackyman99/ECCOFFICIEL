class HistoireFondation {
  final String title;
  final String source;
  final String date;
  final String location;
  final String language;
  final List<HistoireSection> sections;

  HistoireFondation({
    required this.title,
    required this.source,
    required this.date,
    required this.location,
    required this.language,
    required this.sections,
  });

  factory HistoireFondation.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['sections'] ?? [];
    return HistoireFondation(
      title: json['title'] ?? '',
      source: json['source'] ?? '',
      date: json['date'] ?? '',
      location: json['location'] ?? '',
      language: json['language'] ?? '',
      sections: list
          .map((e) => HistoireSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class HistoireSection {
  final int n;
  final String text;

  HistoireSection({required this.n, required this.text});

  factory HistoireSection.fromJson(Map<String, dynamic> json) {
    return HistoireSection(
      n: (json['n'] as num).toInt(),
      text: json['text'] ?? '',
    );
  }
}
