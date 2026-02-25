import 'package:eccofficiel/screens/Programme/event/screens/event_screen.dart';
import 'package:eccofficiel/screens/Programme/Lecture/lecture.dart';
import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';

class Programme extends StatefulWidget {
  const Programme({super.key});

  @override
  State<Programme> createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
                  //  appBar: appBar(),
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                            gradient: gradient1,
                          borderRadius: BorderRadius.circular(5)),
                      child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          padding: const EdgeInsets.all(3.0),
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.white,
                          indicatorColor: orange,
                          indicatorWeight: 2,
                          dividerColor: const Color.fromARGB(0, 33, 149, 243),
                          indicator: BoxDecoration(
                            gradient: gradient2,
                              // color: bleuPlusclaire,
                              borderRadius: BorderRadius.circular(5.0)),
                          tabs: const [
                            Tab(
                              text: 'Lectures',
                            ),
                            Tab(
                              text: 'Events',
                            ),
                          ]),
                    )),
                Flexible(
                  flex: 1,
                  child: TabBarView(children: [
                    const Lecturepage(),
                      EventScreen()

                    //  ItemPage()
                  ]),
                )
              ],
            )),
      
    );
  }
}
