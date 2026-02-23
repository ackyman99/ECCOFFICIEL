class EgliseEvenement {
  final String title;
  final String language;
  final List<EveSection> sections;

  EgliseEvenement({
    required this.title,
    required this.language,
    required this.sections,
  });

  factory EgliseEvenement.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['sections'] ?? [];
    return EgliseEvenement(
      title: json['title'] ?? '',
      language: json['language'] ?? 'fr',
      sections:
          list.map((e) => EveSection.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class EveSection {
  final String title;
  final String? ref;
  final String? text;
  final List<String> items;
  final List<NamedList> lists;

  EveSection({
    required this.title,
    this.ref,
    this.text,
    this.items = const [],
    this.lists = const [],
  });

  factory EveSection.fromJson(Map<String, dynamic> json) {
    final List<dynamic> items = json['items'] ?? [];
    final List<dynamic> lists = json['lists'] ?? [];
    return EveSection(
      title: json['title'] ?? '',
      ref: json['ref'],
      text: json['text'],
      items: items.map((e) => e.toString()).toList(),
      lists:
          lists.map((e) => NamedList.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class NamedList {
  final String title;
  final List<String> items;
  NamedList({required this.title, this.items = const []});
  factory NamedList.fromJson(Map<String, dynamic> json) {
    final List<dynamic> items = json['items'] ?? [];
    return NamedList(
      title: json['title'] ?? '',
      items: items.map((e) => e.toString()).toList(),
    );
  }
}
