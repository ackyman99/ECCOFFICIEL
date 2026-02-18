import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/core/space.dart';
import 'package:eccofficiel/screens/login_screen.dart';
import 'package:eccofficiel/theme.dart';
import 'package:eccofficiel/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.repo});
   final BibleRepository repo;


  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AssetImage _bgImage;

  @override
  void initState() {
    super.initState();
    _bgImage = const AssetImage('assets/images/background2.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_bgImage, context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
              height: height,
              color: Colors.black,
              child: Center(
                child: Image(
                  image: _bgImage,
                  height: height,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 2,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
 RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'BIENVENUE',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
                        ),
                      ]),
                    ),
                 

                const  SizedBox(height: 10,),
                 
 RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'DANS VOTRE ESPACE ECC',
                        // style: headline,
                      ),
                      TextSpan(
                        text: '.',
                        // style: headlineDot,
                      ),
                    ]),
                  ),
                  const SpaceVH(height: 20.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomPrimaryButton(
                    buttonColor: primaryBlue,
                    textValue: 'Suivant',
                    textColor: Colors.white,
                    onPressed: () {
                      
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(repo: widget.repo)));
                    },
                  ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child: CustomPrimaryButton(
                  //     buttonColor: secondaryBlue,
                  //     textValue: 'Carte',
                  //     textColor: Colors.white,
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/carte');
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
