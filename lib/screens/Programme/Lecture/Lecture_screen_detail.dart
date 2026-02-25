import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';
import '../../../../models/lecture.dart';

class Lecturedetail extends StatefulWidget {
  final Lecture lecture;
  const Lecturedetail({super.key, required this.lecture});
  @override
  State<Lecturedetail> createState() => _LecturedetailState();
}

class _LecturedetailState extends State<Lecturedetail> {
  double _fontSize = 16;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lecture du ${widget.lecture.date}"),
          actions: [
            IconButton(
              icon: const Icon(Icons.text_decrease),
              onPressed: () {
                setState(() {
                  _fontSize = (_fontSize - 2).clamp(12, 28);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.text_increase),
              onPressed: () {
                setState(() {
                  _fontSize = (_fontSize + 2).clamp(12, 28);
                });
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: widget.lecture.titrep),
              Tab(text: widget.lecture.titred),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _LectureSection(
              headerGradient: gradient1,
              headerText: '${widget.lecture.titrep}: ${widget.lecture.plecture}',
              content: widget.lecture.contenup,
              fontSize: _fontSize,
            ),
            _LectureSection(
              headerGradient: gradient2,
              headerText: '${widget.lecture.titred}: ${widget.lecture.dlecture}',
              content: widget.lecture.contenud,
              fontSize: _fontSize,
            ),
          ],
        ),
      ),
    );
  }
}

class _LectureSection extends StatelessWidget {
  final Gradient headerGradient;
  final String headerText;
  final String content;
  final double fontSize;
  const _LectureSection({
    required this.headerGradient,
    required this.headerText,
    required this.content,
    required this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 54,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: headerGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headerText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                style: TextStyle(fontSize: fontSize, height: 1.6, color: Theme.of(context).colorScheme.onSurface),
                child: Text(content),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
