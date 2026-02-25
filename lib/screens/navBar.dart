// ignore: file_names
import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';

  AppBar appBar(){
    return AppBar(
      title: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text('Bonjour,', style: const TextStyle(fontSize: 12)),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: const Text('Dorgeles Ackyman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
        ],
      ),
    );
  }



    AppBar appBarDeux(){
    return AppBar(
      title: const Text("data"),
    );
  }
