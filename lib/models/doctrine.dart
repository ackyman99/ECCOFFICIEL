class Doctrine {
  final String title;
  final int reference;
  final String intro;
  final List<DoctrineRule> rules;

  Doctrine({
    required this.title,
    required this.reference,
    required this.intro,
    required this.rules,
  });

  factory Doctrine.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['rules'] ?? [];
    return Doctrine(
      title: json['title'] ?? '',
      reference: (json['reference'] as num?)?.toInt() ?? 0,
      intro: json['intro'] ?? '',
      rules: list
          .map((e) => DoctrineRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DoctrineRule {
  final int id;
  final String text;
  DoctrineRule({required this.id, required this.text});

  factory DoctrineRule.fromJson(Map<String, dynamic> json) {
    return DoctrineRule(
      id: (json['id'] as num).toInt(),
      text: json['text'] ?? '',
    );
  }
}
