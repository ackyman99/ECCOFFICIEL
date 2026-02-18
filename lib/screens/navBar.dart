// ignore: file_names
import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';

  AppBar appBar(){
    return  AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData( color: primaryBlue),
        actionsIconTheme: const IconThemeData(),
          title: Column(children: [
          Align(
            alignment: AlignmentDirectional.topStart,
          child: Text('Bonjour,',style: TextStyle(color: textGrey,fontSize: 12) ,),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: const Text('Dorgeles Ackyman', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),)

        )
        ],),
      );
  }



    AppBar appBarDeux(){
    return AppBar(
        iconTheme: IconThemeData(color: orange),
        actionsIconTheme: const IconThemeData(),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text("data")
      );
  }