import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/screens/accueil.dart';
import 'package:eccofficiel/screens/forgetMdp/step1.dart';
import 'package:eccofficiel/theme.dart';
import 'package:eccofficiel/widgets/input_field.dart';
import 'package:eccofficiel/widgets/primary_button.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.repo});
   final BibleRepository repo;


  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool passwordVisible = false;
  bool isChecked = false;
  late final AssetImage _bgImage;
  late final AssetImage _accentImage;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    _bgImage = const AssetImage("assets/images/background2.png");
    _accentImage = const AssetImage("assets/images/accent.png");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_bgImage, context);
    precacheImage(_accentImage, context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _bgImage,
            fit: BoxFit.cover,
          ),
        ), child: Padding(
          padding: const  EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Connectez-vous à\nvotre compte',
                    style: heading2.copyWith(color: textWhite),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image(
                    image: _accentImage,
                    width: 99,
                    height: 4,
                    gaplessPlayback: true,
                  ),
                ],
              ),
             const  SizedBox(
                height: 48,
              ),

              Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    boxShadow: [
                                BoxShadow(
                                    // ignore: deprecated_member_use
                                    color: Colors.black.withOpacity(0.10),
                                    spreadRadius: 0.0,
                                    blurRadius: 20.0,
                                    offset:const Offset(0, 4))
                              ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Form(
                child: Column(
                  children: [

                    Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nom d'utilisateur",
                      style: TextStyle(fontSize: 10, color: textGrey),
                    ),
                  ),
                    InputField(
                      hintText: 'Email',
                      suffixIcon: const SizedBox(),
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 32,
                    ),

                    Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Mot de passe",
                      style: TextStyle(fontSize: 10, color: textGrey),
                    ),
                  ),
                    
                    InputField(
                      hintText: 'Entre votre mot de passe',
                      controller: passwordController,
                      obscureText: !passwordVisible,
                      suffixIcon: IconButton(
                        color: textGrey,
                        splashRadius: 1,
                        icon: Icon(passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePassword,
                      ),
                    ),
                  ],
                ),
              ),
 const SizedBox(
                height: 32,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isChecked ? primaryBlue : Colors.transparent,
                        borderRadius: BorderRadius.circular(4.0),
                        border: isChecked
                            ? null
                            : Border.all(color: textGrey, width: 1.5),
                      ),
                      width: 20,
                      height: 20,
                      child: isChecked
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rester connecté',
                        style: regular16pt.copyWith(color: textGrey),
                      ),
                    ],
                  ),
                ],
              ),
              
             const  SizedBox(
                height: 32,
              ),
               CustomPrimaryButton(
                    buttonColor: primaryBlue,
                    textValue: 'Conexion',
                    textColor: Colors.white,
                    onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Accueil(repo: widget.repo,)));
                    },
                  ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Step1(repo: widget.repo,)));
                    },
                    child:  Text(
                    "Mot de passe oublié? ",
                    style: regular16pt.copyWith(color: textGrey),
                  ),
                  ),
                ],
              ),
                     ],
                  )),
              
             
             
              
              
            ],
          ),
        ),
      ),
    ));
  }
}
