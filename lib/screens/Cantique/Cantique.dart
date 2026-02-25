import 'package:eccofficiel/screens/cantique/Texte/texte.dart';
import 'package:eccofficiel/screens/cantique/Audio/audio.dart';
import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class cantique extends StatefulWidget {
  const cantique({super.key});

  @override
  State<cantique> createState() => _cantiqueState();
}

// ignore: camel_case_types
class _cantiqueState extends State<cantique> {
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
                              text: 'Texte',
                            ),
                            Tab(
                              text: 'Audio',
                            ),
                          ]),
                    )),
                Flexible(
                  flex: 1,
                  child: TabBarView(children: [
                    const texte(),
                    const audio()
                  ]),
                )
              ],
            )),
      
    );
  }
}
