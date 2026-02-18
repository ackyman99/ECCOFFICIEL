class Cantique {
  final String typee;
  final int numero;
  final String titre;
  final String cantique;
  final String icone;

  Cantique({
    required this.typee,
    required this.numero,
    required this.titre,
    required this.cantique,
    required this.icone,
  });

  factory Cantique.fromJson(Map<String, dynamic> json) {
    return Cantique(
      typee: json['typee'],
      numero: json['numero'],
      titre: json['titre'],
      cantique: json['cantique'],
      icone: json['icone'],
    );
  }
}
