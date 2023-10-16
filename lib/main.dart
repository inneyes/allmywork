import 'package:flutter/material.dart';
//import 'package:onboarding_screen/screens/onboarding-screen.dart';
// import 'package:onboarding_screen/screens/onboarding-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onboarding_screen/auth_page.dart';
//import 'package:onboarding_screen/sign_in/sign_in.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      const MyApp()); //const use when u want to fix a value : Final not fix value
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding-screen',
      theme: ThemeData.light(useMaterial3: true),
      home: const AuthPage(),
    );
  }
}
