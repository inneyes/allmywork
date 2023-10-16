import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/mybutton.dart';
import 'package:onboarding_screen/component/myiconbuttin.dart';
import 'package:onboarding_screen/component/mytextbutton.dart';
import 'package:onboarding_screen/component/mytextfiled.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void SignInUser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print("it's oki");
    } else {
      print("please put your email and password");
    }
  }

   signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      _showMyDialog('Login successfully.');

    } on FirebaseAuthException catch (e) {
      // check e.error
      print('Failed with error code: ${e.code}');
      print(e.message);

      if (e.code == 'invalid-email') {
        _showMyDialog('No user found for that email.');
        // print('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        // print('Wrong password provided for that user.');
        _showMyDialog('Wrong password provided for that user.');
      }
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Welcome,Meow",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "please sign in with your email and password",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30),
              MyTextFiled(
                  controller: emailController,
                  hintText: 'please put your email',
                  labelText: 'email',
                  obscureText: false),
              const SizedBox(height: 30),
              MyTextFiled(
                  controller: passwordController,
                  hintText: 'please put your password',
                  labelText: 'password',
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              const MyTextButton(
                labelText: 'forgot password?',
                pageRoute: 'forgot',
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(ontap: signInWithEmailAndPassword, hintText: 'Sign in'),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 141, 137, 137),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 141, 137, 137),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myIconButton(imagePath: 'assets/image/apple.png'),
                  SizedBox(
                    width: 10,
                  ),
                  myIconButton(imagePath: 'assets/image/google.png'),
                ],
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("not a member?"),
                    MyTextButton(
                      labelText: 'register now',
                      pageRoute: 'register',
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
