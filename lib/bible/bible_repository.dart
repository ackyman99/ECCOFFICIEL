import 'package:eccofficiel/bible/json_loader.dart';
import 'package:eccofficiel/bible/verse_model.dart';

class BibleRepository {
  late List<Verse> _verses;

  Future<void> init() async {
    final data = await JsonLoader.loadBible();
    _verses = (data['verses'] as List)
        .map((e) => Verse.fromJson(e))
        .toList();
  }

  List<String> getBooks() {
    return _verses
        .map((v) => v.bookName)
        .toSet()
        .toList();
  }

  List<int> getChapters(String bookName) {
    return _verses
        .where((v) => v.bookName == bookName)
        .map((v) => v.chapter)
        .toSet()
        .toList()
      ..sort();
  }

  List<Verse> getVerses(String bookName, int chapter) {
    return _verses.where((v) =>
        v.bookName == bookName && v.chapter == chapter).toList();
  }
}
