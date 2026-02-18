import 'package:flutter/material.dart';

Color primaryBlue = Color(0xff2972ff);
Color secondaryBlue = Color(0xff273a96);
Color orange = Color(0xffff9800);
Color textBlack = Color(0xff222222);
Color textWhite = Color(0xffffffff);

Color textGrey = Color(0xff94959b);
Color textWhiteGrey = Color(0xfff1f1f5);

TextStyle heading2 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle heading5 = TextStyle(
  fontSize: 10,
);

TextStyle heading6 = TextStyle(
  fontSize: 10,
);

TextStyle regular16pt = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle regular15pt = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
);



// ---------------------COULEURS------------------
const Color bleuclair = Color(0xFF2c5da3);
const Color bleuPlusclaire = Color(0xFF58a4d9);

const Color orangepure = Color(0xFFec6f42);
const Color orangeclair = Color(0xFFdf843b);




// ---------------------DEGRADE--------------------------
const gradient1 = LinearGradient(
  colors: [bleuclair, bleuPlusclaire],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);


const gradient2 = LinearGradient(
  colors: [orangepure, orangeclair],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);


const List<Color> gradient = [
  Color.fromRGBO(24, 26, 32, 1),
  Color.fromRGBO(24, 26, 32, 0.9),
  Color.fromRGBO(24, 26, 32, 0.8),
  Color.fromRGBO(24, 26, 32, 0.7),
  Color.fromRGBO(24, 26, 32, 0.6),
  Color.fromRGBO(24, 26, 32, 0.5),
  Color.fromRGBO(24, 26, 32, 0.4),
  Color.fromRGBO(24, 26, 32, 0.0),
];