import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/screens/Programme/event/core/timezone.dart';
import 'package:eccofficiel/screens/Programme/event/screens/event_screen.dart';
import 'package:eccofficiel/screens/Programme/event/services/event_service.dart';
import 'package:eccofficiel/screens/Programme/Carte/carte.dart';
import 'package:eccofficiel/screens/splash_screen.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocalTimezone();
  final bibleRepo = BibleRepository();
  await bibleRepo.init();
  runApp(MyApp(repo: bibleRepo));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.repo});
  final BibleRepository repo;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      EventService().initNotifications();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const bool useEventEntry = bool.fromEnvironment('ENTRY_EVENT', defaultValue: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeSlideTransitionsBuilder(),
            TargetPlatform.iOS: FadeSlideTransitionsBuilder(),
            TargetPlatform.windows: FadeSlideTransitionsBuilder(),
            TargetPlatform.macOS: FadeSlideTransitionsBuilder(),
            TargetPlatform.linux: FadeSlideTransitionsBuilder(),
          },
        ),
      ),
      routes: {
        '/carte': (_) => const CarteScreen(),
      },
      home: useEventEntry ? const EventScreen() : HomePage(repo: widget.repo),
    );
  } 
}

class FadeSlideTransitionsBuilder extends PageTransitionsBuilder {
  const FadeSlideTransitionsBuilder();
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    final fade = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
    final slide = Tween<Offset>(begin: const Offset(0, 0.04), end: Offset.zero).animate(curved);
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(position: slide, child: child),
    );
  }
}

