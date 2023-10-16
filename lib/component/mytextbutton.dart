import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/sign_in/sign_in.dart';
import 'package:onboarding_screen/sign_up/signup.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton(
      {super.key, required this.labelText, required this.pageRoute});

  final String labelText;
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                if (pageRoute == 'register') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SignUpScreen()),
                      ));
                } else if (pageRoute == 'sign in') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                }
              },
              child: Text(
                labelText,
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent),
              ))
        ],
      ),
    );
  }
}
