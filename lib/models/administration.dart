class Administration {
  final String title;
  final String language;
  final List<AdminSection> sections;

  Administration({
    required this.title,
    required this.language,
    required this.sections,
  });

  factory Administration.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['sections'] ?? [];
    return Administration(
      title: json['title'] ?? '',
      language: json['language'] ?? 'fr',
      sections: list
          .map((e) => AdminSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class AdminSection {
  final String title;
  final String? ref;
  final String? text;
  final List<String> items;

  AdminSection({
    required this.title,
    this.ref,
    this.text,
    this.items = const [],
  });

  factory AdminSection.fromJson(Map<String, dynamic> json) {
    final List<dynamic> items = json['items'] ?? [];
    return AdminSection(
      title: json['title'] ?? '',
      ref: json['ref'],
      text: json['text'],
      items: items.map((e) => e.toString()).toList(),
    );
  }
}
