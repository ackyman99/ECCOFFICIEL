import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:flutter/material.dart';
import 'verses_screen.dart';

class ChaptersScreen extends StatelessWidget {
  final BibleRepository repo;
  final String bookName;

  const ChaptersScreen({
    super.key,
    required this.repo,
    required this.bookName,
  });

  @override
  Widget build(BuildContext context) {
    final chapters = repo.getChapters(bookName);

    return Scaffold(
      appBar: AppBar(title: Text(bookName)),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1),
        itemCount: chapters.length,
        itemBuilder: (_, i) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VersesScreen(
                  repo: repo,
                  bookName: bookName,
                  chapter: chapters[i],
                ),
              ),
            );
          },
          child: Card(
            child: Center(child: Text('${chapters[i]}')),
          ),
        ),
        cacheExtent: 600,
      ),
    );
  }
}
