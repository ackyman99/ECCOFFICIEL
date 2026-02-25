import 'dart:math';

import 'package:eccofficiel/core/eventClass.dart';
import 'package:eccofficiel/screens/Programme/event/data/event_repository.dart';
import 'package:eccofficiel/screens/Programme/event/models/event_model.dart';
import 'package:eccofficiel/screens/Programme/event/services/event_service.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';


class EventScreen extends StatefulWidget {
  const EventScreen({super.key});
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final EventService _service = EventService();
  final EventRepository _repo = EventRepository();
  List<EventModel> _allEvents = [];
  List<EventModel> _filteredEvents = [];
  final TextEditingController _searchController = TextEditingController();


Color randomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}


  @override
  void initState() {
    super.initState();
    _service.initNotifications();
    _loadData();
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _loadData() async {
    _allEvents = await _repo.fetchEvents();
    _filteredEvents = _allEvents;
    for (var e in _allEvents) {
      _service.scheduleReminder(e);
    }
    setState(() {});
  }

  void _onSearchChanged() {
    setState(() {
      _filteredEvents = _allEvents
          .where((e) => e.title.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Rechercher un événement...",
                prefixIcon: const Icon(Iconsax.search_normal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: ElevatedButton(
          //       onPressed: () => _service.scheduleTestNotification(),
          //       child: const Text("Tester la notification"),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: ElevatedButton(
          //       onPressed: () => _service.showImmediateTestNotification(),
          //       child: const Text("Notification immédiate (show)"),
          //     ),
          //   ),
          // ),

          Expanded(
            child: ListView.builder(
              itemCount: _filteredEvents.length,
              itemBuilder: (context, index) {
                final event = _filteredEvents[index];
                return Container(
              padding: EdgeInsets.all(10),

              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Stack(children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: randomColor(),
                        child: Center(
                            child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            event.typee,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.paroisse.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Row(children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(children: [
                                      Expanded(
                                        flex: 2,
                                        child: Material(
                                          elevation: 2,
                                          child: Container(
                                            color: const Color.fromARGB(255, 25, 10, 10),
                                            child: Image.asset(
                                              'assets/images/background2.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Image.asset('assets/images/bar_code.jpg')
                                    ]),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.calendar_today),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(DateFormat('dd/MM/yyyy HH:mm').format(event.startDate)),
                                              )
                                            ],
                                          ),
                                           Row(
                                            children: [
                                              Icon(Icons.location_on_outlined),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  event.lieu,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          
                                        ]),
                                  ),
                                ]),
                              ),
                            ]),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomPaint(
                  painter: SideCutsDesign(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                  ),
                ),
                CustomPaint(
                  painter: DottedInitialPath(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                  ),
                ),
                CustomPaint(
                  painter: DottedMiddlePath(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                  ),
                ),
              ]),
            );
              },
              cacheExtent: 600,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPending() async {
    final pending = await _service.getPendingNotifications();
    if (!mounted) return;
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Notifications en attente"),
          content: SizedBox(
            width: double.maxFinite,
            child: pending.isEmpty
                ? const Text("Aucune notification en attente.")
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: pending.length,
                    itemBuilder: (_, i) {
                      final p = pending[i];
                      return ListTile(
                        title: Text("ID ${p.id}"),
                        subtitle: Text("${p.title ?? ''}\n${p.body ?? ''}"),
                      );
                    },
                  ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Fermer")),
          ],
        );
      },
    );
  }

  Future<void> _clearPending() async {
    await _service.cancelAllPending();
    if (!mounted) return;
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Annulation"),
          content: const Text("Toutes les notifications en attente ont été annulées."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("OK")),
          ],
        );
      },
    );
  }
}
