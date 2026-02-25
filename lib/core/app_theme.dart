import 'package:flutter/material.dart';
import 'package:eccofficiel/theme.dart';

class _Transitions {
  static const page = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeSlideTransitionsBuilder(),
      TargetPlatform.iOS: FadeSlideTransitionsBuilder(),
      TargetPlatform.windows: FadeSlideTransitionsBuilder(),
      TargetPlatform.macOS: FadeSlideTransitionsBuilder(),
      TargetPlatform.linux: FadeSlideTransitionsBuilder(),
    },
  );
}

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: bleuclair, brightness: Brightness.light),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  pageTransitionsTheme: _Transitions.page,
  cardTheme:  CardThemeData(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

  ),
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    minLeadingWidth: 24,
    horizontalTitleGap: 12,
  ),
  dividerTheme: const DividerThemeData(
    thickness: 1,
    space: 16,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    filled: true,
    isDense: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  ),
  chipTheme: ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
    side: BorderSide.none,
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: bleuclair, brightness: Brightness.dark),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF121212),
  pageTransitionsTheme: _Transitions.page,
  cardTheme:  CardThemeData(
    color: const Color(0xFF1E1E1E),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    minLeadingWidth: 24,
    horizontalTitleGap: 12,
  ),
  dividerTheme: const DividerThemeData(
    thickness: 1,
    space: 16,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    filled: true,
    isDense: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  ),
  chipTheme: ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
    side: BorderSide.none,
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

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
