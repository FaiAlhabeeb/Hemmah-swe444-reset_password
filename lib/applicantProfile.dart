import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'GetDatafromCompony.dart';
import 'SettingsC.dart';

import 'package:firebase_auth/firebase_auth.dart';


class componyProfile extends StatefulWidget {
  
  const componyProfile ({super.key});


  @override
  State<componyProfile> createState() => _componyProfileState();
}

class _componyProfileState extends State<componyProfile> {
   final credintial = FirebaseAuth.instance.currentUser;
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
  leading: const BackButton(
    color: Colors.black),
       title: Text(
        ' Applicant Profile',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          height: 1.50,
        ),
      ),  

actions: [
    IconButton(
      icon: Icon(
        Icons.settings,
        color: Colors.black,
      ),
      onPressed:() {
      Navigator.push(context,MaterialPageRoute(builder: (context) =>const SettingsC()));
        
      }
    ),
],
      ),
    
    );
  }
}
    