import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:flutter/material.dart';
import 'chapters_screen.dart';

class BooksScreen extends StatelessWidget {
  final BibleRepository repo;
  const BooksScreen({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final books = repo.getBooks();

    return Scaffold(
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(books[i]),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ChaptersScreen(repo: repo, bookName: books[i]),
              ),
            );
          },
        ),
      ),
    );
  }
}
