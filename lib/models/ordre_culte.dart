class OrdreCulte {
  final String title;
  final String language;
  final List<OrdreSection> sections;

  OrdreCulte({
    required this.title,
    required this.language,
    required this.sections,
  });

  factory OrdreCulte.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['sections'] ?? [];
    return OrdreCulte(
      title: json['title'] ?? '',
      language: json['language'] ?? 'fr',
      sections: list
          .map((e) => OrdreSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class OrdreSection {
  final String title;
  final String? ref;
  final String? text;
  final List<String> items;
  final List<OrdreName> saintsNames;
  final List<OrdreRite> rites;
  final List<OrdreDefinition> definitions;
  final List<String> conditions;

  OrdreSection({
    required this.title,
    this.ref,
    this.text,
    this.items = const [],
    this.saintsNames = const [],
    this.rites = const [],
    this.definitions = const [],
    this.conditions = const [],
  });

  factory OrdreSection.fromJson(Map<String, dynamic> json) {
    final List<dynamic> items = json['items'] ?? [];
    final List<dynamic> names = json['saintsNames'] ?? [];
    final List<dynamic> rites = json['rites'] ?? [];
    final List<dynamic> defs = json['definitions'] ?? [];
    final List<dynamic> conds = json['conditions'] ?? [];
    return OrdreSection(
      title: json['title'] ?? '',
      ref: json['ref'],
      text: json['text'],
      items: items.map((e) => e.toString()).toList(),
      saintsNames: names
          .map((e) => OrdreName.fromJson(e as Map<String, dynamic>))
          .toList(),
      rites: rites
          .map((e) => OrdreRite.fromJson(e as Map<String, dynamic>))
          .toList(),
      definitions: defs
          .map((e) => OrdreDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: conds.map((e) => e.toString()).toList(),
    );
  }
}

class OrdreName {
  final String name;
  final String meaning;
  OrdreName({required this.name, required this.meaning});
  factory OrdreName.fromJson(Map<String, dynamic> json) {
    return OrdreName(
      name: json['name'] ?? '',
      meaning: json['meaning'] ?? '',
    );
  }
}

class OrdreRite {
  final String code;
  final String title;
  final String text;
  OrdreRite({required this.code, required this.title, required this.text});
  factory OrdreRite.fromJson(Map<String, dynamic> json) {
    return OrdreRite(
      code: json['code'] ?? '',
      title: json['title'] ?? '',
      text: json['text'] ?? '',
    );
  }
}

class OrdreDefinition {
  final String code;
  final String text;
  OrdreDefinition({required this.code, required this.text});
  factory OrdreDefinition.fromJson(Map<String, dynamic> json) {
    return OrdreDefinition(
      code: json['code'] ?? '',
      text: json['text'] ?? '',
    );
  }
}
