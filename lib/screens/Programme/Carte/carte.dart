import 'package:flutter/material.dart';
import 'package:eccofficiel/theme.dart';
import 'package:eccofficiel/models/user.dart';

class CarteScreen extends StatefulWidget {
  const CarteScreen({super.key});
  @override
  State<CarteScreen> createState() => _CarteScreenState();
}

class _CarteScreenState extends State<CarteScreen> {
  late UserModel _user;
  final _nom = TextEditingController();
  final _prenoms = TextEditingController();
  final _sexe = TextEditingController();
  final _nationalite = TextEditingController();
  final _lieuNaissance = TextEditingController();
  final _dateNaissance = TextEditingController();
  final _nomUsage = TextEditingController();
  final _numeroDocument = TextEditingController();
  final _dateExpiration = TextEditingController();
  final _code = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = UserModel.sample();
    _nom.text = _user.nom;
    _prenoms.text = _user.prenoms;
    _sexe.text = _user.sexe;
    _nationalite.text = _user.nationalite;
    _lieuNaissance.text = _user.lieuNaissance;
    _dateNaissance.text = _user.dateNaissance;
    _nomUsage.text = _user.nomUsage;
    _numeroDocument.text = _user.numeroDocument;
    _dateExpiration.text = _user.dateExpiration;
    _code.text = _user.code;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carte'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Formulaire'),
            Tab(text: 'Prévisualisation'),
          ]),
        ),
        body: TabBarView(
          children: [
            _buildForm(),
            _buildCard(_user),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _field('Nom', _nom),
          _field('Prénoms', _prenoms),
          Row(
            children: [
              Expanded(child: _field('Sexe', _sexe)),
              const SizedBox(width: 8),
              Expanded(child: _field('Nationalité', _nationalite)),
            ],
          ),
          Row(
            children: [
              Expanded(child: _field('Lieu de naissance', _lieuNaissance)),
              const SizedBox(width: 8),
              Expanded(child: _field('Date de naissance', _dateNaissance)),
            ],
          ),
          Row(
            children: [
              Expanded(child: _field('Nom d’usage', _nomUsage)),
              const SizedBox(width: 8),
              Expanded(child: _field('N° du document', _numeroDocument)),
            ],
          ),
          Row(
            children: [
              Expanded(child: _field('Date d’expiration', _dateExpiration)),
              const SizedBox(width: 8),
              Expanded(child: _field('Code', _code)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _user = UserModel(
                    nom: _nom.text,
                    prenoms: _prenoms.text,
                    sexe: _sexe.text,
                    nationalite: _nationalite.text,
                    lieuNaissance: _lieuNaissance.text,
                    dateNaissance: _dateNaissance.text,
                    nomUsage: _nomUsage.text,
                    numeroDocument: _numeroDocument.text,
                    dateExpiration: _dateExpiration.text,
                    code: _code.text,
                    photoPath: null,
                  );
                });
              },
              child: const Text('Mettre à jour la carte'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(UserModel u) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.58,
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: gradient1,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'RÉPUBLIQUE FRANÇAISE\nCARTE NATIONALE D’IDENTITÉ',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        gradient: gradient2,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text('FR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 110,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.person, size: 48, color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _kv(context, 'NOM', u.nom),
                            _kv(context, 'Prénoms', u.prenoms),
                            Row(
                              children: [
                                Expanded(child: _kv(context, 'SEXE', u.sexe)),
                                const SizedBox(width: 8),
                                Expanded(child: _kv(context, 'Nationalité', u.nationalite)),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: _kv(context, 'Lieu de naissance', u.lieuNaissance)),
                                const SizedBox(width: 8),
                                Expanded(child: _kv(context, 'Date de naiss.', u.dateNaissance)),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: _kv(context, 'Nom d’usage', u.nomUsage)),
                                const SizedBox(width: 8),
                                Expanded(child: _kv(context, 'N° du document', u.numeroDocument)),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: _kv(context, 'Date d’expir.', u.dateExpiration)),
                                const SizedBox(width: 8),
                                Expanded(child: _kv(context, 'Code', u.code)),
                              ],
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Signature',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'monospace',
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _kv(BuildContext context, String k, String v) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            k,
            style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ),
        Expanded(
          child: Text(
            v,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget _field(String label, TextEditingController c) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(
      controller: c,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
