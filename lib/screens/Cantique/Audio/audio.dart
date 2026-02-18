import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class audio extends StatefulWidget {
  const audio({super.key});

  @override
  State<audio> createState() => _audioState();
}

// ignore: camel_case_types
class _audioState extends State<audio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:const EdgeInsets.only(left: 10, right: 10, top: 15,),
          child: Align(
            alignment: Alignment.topLeft,
            child: Center(
              child: Text(
                "Binevenue dans la section audio bientot disponible",
                style: TextStyle(color: textGrey),
              ),
            ),
          ),
        ),

      ],
    );
  }
}