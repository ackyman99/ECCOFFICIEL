import 'package:eccofficiel/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final AssetImage _bgImage;

  @override
  void initState() {
    super.initState();
    _bgImage = const AssetImage("assets/images/background2.png");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_bgImage, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * .6 + 30, //70 for bottom
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 40, // to shift little up
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: _bgImage,
                                fit: BoxFit.cover),
                            // color: Colors.amber,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            ),
                          ),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.6,
                        ),
                      ),
                      Positioned(
                        top: constraints.maxHeight * .4,
                        height: 200,
                        left: 10,
                        right: 10,
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                gradient: gradient1),
                            child: Column(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15,
                                          bottom: 5,
                                          right: 10,
                                          left: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  height: 95,
                                                  width: 95,
                                                  margin: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black
                                                                // ignore: deprecated_member_use
                                                                .withOpacity(
                                                                    0.10),
                                                            spreadRadius: 0.0,
                                                            blurRadius: 20.0,
                                                            offset:
                                                                Offset(0, 4))
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Icon(Iconsax.music_playlist,
                                                          color: orange,
                                                          size: 20),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "25",
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold,
                                                            color: bleuPlusclaire
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Cantiques",
                                                          maxLines: 2,
                                                          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: textGrey),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Container(
                                                  height: 95,
                                                  width: 95,
                                                  margin: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.10),
                                                            spreadRadius: 0.0,
                                                            blurRadius: 20.0,
                                                            offset:
                                                                Offset(0, 4))
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Icon(Icons.church_sharp,
                                                          color: orange,
                                                          size: 20),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "250",
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold,
                                                            color: bleuPlusclaire
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Paroisses",
                                                          maxLines: 2,
                                                          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: textGrey),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                 Container(
                                                  height: 95,
                                                  width: 90,
                                                  margin: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.10),
                                                            spreadRadius: 0.0,
                                                            blurRadius: 20.0,
                                                            offset:
                                                                Offset(0, 4))
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Icon(Iconsax.bag_happy,
                                                          color: orange,
                                                          size: 20),
                                                      const SizedBox(
                                                          height: 10),
                                                      const Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "25",
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold,
                                                            color: bleuPlusclaire
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Moissons",
                                                          maxLines: 2,
                                                          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: textGrey),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13,top: 13,bottom: 5),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: gradient2),
                      child: ListTile(
                        title: Text(
                          "Doument",
                          style: regular16pt.copyWith(color: textWhite),
                        ),
                        subtitle: Text(
                          "300",
                          style: regular15pt.copyWith(color: textWhite),
                        ),
                        trailing: Icon(Iconsax.folder, color: Colors.white,),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13,top: 5,bottom: 5),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: gradient2),
                      child: ListTile(
                        title: Text(
                          "Comité Paroissial",
                          style: regular16pt.copyWith(color: textWhite),
                        ),
                        subtitle: Text(
                          "500.000 F CFA",
                          style: regular15pt.copyWith(color: textWhite),
                        ),
                                                trailing: Icon(Iconsax.wallet, color: Colors.white,),

                      )),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
