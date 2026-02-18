class UserModel {
  final String nom;
  final String prenoms;
  final String sexe;
  final String nationalite;
  final String lieuNaissance;
  final String dateNaissance;
  final String nomUsage;
  final String numeroDocument;
  final String dateExpiration;
  final String code;
  final String? photoPath;

  const UserModel({
    required this.nom,
    required this.prenoms,
    required this.sexe,
    required this.nationalite,
    required this.lieuNaissance,
    required this.dateNaissance,
    required this.nomUsage,
    required this.numeroDocument,
    required this.dateExpiration,
    required this.code,
    this.photoPath,
  });

  factory UserModel.sample() {
    return const UserModel(
      nom: 'MARTIN',
      prenoms: 'Maëlys-Gaëlle, Marie',
      sexe: 'F',
      nationalite: 'FRA',
      lieuNaissance: 'PARIS',
      dateNaissance: '13 07 1990',
      nomUsage: 'NOM D’USAGE',
      numeroDocument: 'X4RTBPFW4',
      dateExpiration: '11 02 2030',
      code: '384213',
      photoPath: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenoms': prenoms,
      'sexe': sexe,
      'nationalite': nationalite,
      'lieuNaissance': lieuNaissance,
      'dateNaissance': dateNaissance,
      'nomUsage': nomUsage,
      'numeroDocument': numeroDocument,
      'dateExpiration': dateExpiration,
      'code': code,
      'photoPath': photoPath,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nom: json['nom'] as String,
      prenoms: json['prenoms'] as String,
      sexe: json['sexe'] as String,
      nationalite: json['nationalite'] as String,
      lieuNaissance: json['lieuNaissance'] as String,
      dateNaissance: json['dateNaissance'] as String,
      nomUsage: json['nomUsage'] as String,
      numeroDocument: json['numeroDocument'] as String,
      dateExpiration: json['dateExpiration'] as String,
      code: json['code'] as String,
      photoPath: json['photoPath'] as String?,
    );
  }
}
