import 'package:eccofficiel/models/lecture.dart';
import 'package:eccofficiel/screens/Programme/Lecture/Lecture_screen_detail.dart';
import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'lecture_service.dart';

class Lecturepage extends StatefulWidget {
  const Lecturepage({super.key});

  @override
  State<Lecturepage> createState() => _LecturepageState();
}

class _LecturepageState extends State<Lecturepage> {
  List<Lecture> _all = [];
  List<Lecture> _filtered = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    _all = await LectureService.loadLectures();
    setState(() => _filtered = _all);
  }

  void _search(String value) {
    setState(() {
      _filtered = _all.where((c) {
        return c.date.toLowerCase().contains(value.toLowerCase()) ||
            c.date.toString().contains(value);
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: _search,
              decoration: InputDecoration(
                hintText: "Rechercher une date...",
                prefixIcon: const Icon(Iconsax.search_normal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (context, index) {
                final lecture = _filtered[index];
                return GestureDetector(
          onTap: () {
            Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              Lecturedetail(lecture: lecture),
                        ),
                      );
          },
          child: Card(
            margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/folder.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: 30,
                  width: 1.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          children: [
                            Text(
                              lecture.date,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ]),
                      Text("Premiere lecture: ${lecture.plecture}"),
                      Text("Deuxime lecture: ${lecture.dlecture}"),

                    ],
                  ),
                ),
                Icon(
                  Iconsax.arrow_circle_right5,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
              ),
            ),
          ),
        );
  
              },
            ),
          ),
        ],
      ),
    );
  }
}
