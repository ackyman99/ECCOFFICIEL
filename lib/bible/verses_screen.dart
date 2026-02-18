import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:flutter/material.dart';

class VersesScreen extends StatelessWidget {
  final BibleRepository repo;
  final String bookName;
  final int chapter;

  const VersesScreen({
    super.key,
    required this.repo,
    required this.bookName,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context) {
    final verses = repo.getVerses(bookName, chapter);

    return Scaffold(
      appBar: AppBar(
        title: Text('$bookName $chapter'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: verses.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: '${verses[i].verse} ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(text: verses[i].text),
              ],
            ),
          ),
        ),
        cacheExtent: 600,
      ),
    );
  }
}
