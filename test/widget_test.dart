// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/bible/verse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eccofficiel/main.dart';

class MockBibleRepository implements BibleRepository {
  @override
  List<String> getBooks() {
    throw UnimplementedError();
  }

  @override
  List<int> getChapters(String bookName) {
    throw UnimplementedError();
  }

  @override
  List<Verse> getVerses(String bookName, int chapter) {
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    throw UnimplementedError();
  }
}

void main() {
  testWidgets('Smoke: Home page renders and shows Suivant button', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(repo: MockBibleRepository()));
    expect(find.text('Suivant'), findsOneWidget);
  });
}
