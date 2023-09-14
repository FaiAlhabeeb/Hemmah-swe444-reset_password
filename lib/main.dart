import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hemmah/SettingsC.dart';
import 'package:hemmah/aboutus.dart';
import 'package:hemmah/signup.dart';
import 'package:hemmah/start.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemmah/userchoice.dart';

import 'LoginApplicants.dart';
import 'SignupAsApplicants.dart';
import 'componyProfile.dart';
import 'homepage.dart';
import 'homepageapplicant.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Start(),
        '/login': (context) => Login(),
        "/signup": (context) => Signup(),
        "/userchoice": (context) => const userchoice(),
        "/SignupAsApplicants": (context) => SignupAsApplicants(),
        "/homepage": (context) => homepage(),
        "/homepageapplicant": (context) => homepageapplicant(),
        "/LoginApplicants": (context) => LoginApplicants(),
        "/componyProfile": (context) => const componyProfile(),
        "/Settings": (context) => const SettingsC(),
        "/aboutus": (context) => const aboutus(),
      },
    );
  }
}
