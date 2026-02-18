import 'package:eccofficiel/bible/bible_repository.dart';
import 'package:eccofficiel/screens/forgetMdp/step2.dart';
import 'package:eccofficiel/theme.dart';
import 'package:eccofficiel/widgets/input_field.dart';
import 'package:eccofficiel/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key, required this.repo});
   final BibleRepository repo;

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  bool passwordVisible = false;
  bool isChecked = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
    final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background2.png",
            ),
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
                    'Réccupérer mon mot \nde passe',
                    style: heading2.copyWith(color: textWhite),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/accent.png',
                    width: 99,
                    height: 4,
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
                    
              Image.asset(
                    'assets/images/Otp1.png',
                    width: 100,
                    height: 100,
                  ),
                    InputField(
                      hintText: 'Email',
                      suffixIcon: const SizedBox(),
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),

               CustomPrimaryButton(
                    buttonColor: primaryBlue,
                    textValue: 'Suivant',
                    textColor: Colors.white,
                    onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Step2(repo: widget.repo,)));
                    },
                  ),
              const SizedBox(
                height: 15,
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