class Verse {
  final String bookName;
  final int book;
  final int chapter;
  final int verse;
  final String text;

  Verse({
    required this.bookName,
    required this.book,
    required this.chapter,
    required this.verse,
    required this.text,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      bookName: json['book_name'],
      book: json['book'],
      chapter: json['chapter'],
      verse: json['verse'],
      text: json['text'],
    );
  }
}
