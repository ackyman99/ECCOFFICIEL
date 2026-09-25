class Cantique {
  final String type;
  final int numero;
  final String titre;
  final String texte;
  final String icone;
  final String mp3;
  final String reference;

  Cantique({
    required this.type,
    required this.numero,
    required this.titre,
    required this.texte,
    required this.icone,
    required this.mp3,
    required this.reference,
  });

  factory Cantique.fromJson(Map<String, dynamic> json) {
    return Cantique(
      type: json['type'] as String? ?? '',
      numero: json['numero'] as int? ?? 0,
      titre: json['titre'] as String? ?? '',
      texte: json['texte'] as String? ?? '',
      icone: json['icone'] as String? ?? '',
      mp3: json['mp3'] as String? ?? '',
      reference: json['reference'] as String? ?? '',
    );
  }
}
