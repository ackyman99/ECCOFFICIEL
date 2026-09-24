import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/screens/Programme/event/core/timezone.dart';
import 'package:eccofficiel/screens/Programme/event/screens/event_screen.dart';
import 'package:eccofficiel/screens/Programme/event/services/event_service.dart';
import 'package:eccofficiel/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eccofficiel/core/theme_controller.dart';
import 'package:eccofficiel/core/app_theme.dart';
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocalTimezone();
  final bibleRepo = BibleRepository();
  await bibleRepo.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController()..load(),
      child: MyApp(repo: bibleRepo),
    ),
  );
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
  // bienvenu
  Widget build(BuildContext context) {
    const bool useEventEntry = bool.fromEnvironment('ENTRY_EVENT', defaultValue: false);
    final themeCtrl = context.watch<ThemeController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECC',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeCtrl.themeMode,
      home: useEventEntry ? const EventScreen() : HomePage(repo: widget.repo),
    );
  } 
}

