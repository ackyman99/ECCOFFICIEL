import 'package:eccofficiel/models/cantique.dart';

class SearchHelper {
  static List<Cantique> filter(
      List<Cantique> list, String query) {
    final q = query.toLowerCase();

    return list.where((c) {
      return c.numero.toString().contains(q) ||
          c.titre.toLowerCase().contains(q) ||
          c.texte.toLowerCase().contains(q) ||
          c.reference.toLowerCase().contains(q);
    }).toList();
  }
}
