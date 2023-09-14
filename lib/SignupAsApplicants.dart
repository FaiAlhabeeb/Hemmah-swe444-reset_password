import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:hemmah/login.dart';

import 'LoginApplicants.dart';
TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

class SignupAsApplicants extends StatefulWidget {
  const SignupAsApplicants({super.key});

  @override
  State<SignupAsApplicants> createState() => _SignupAsApplicantsState();
}

class _SignupAsApplicantsState extends State<SignupAsApplicants> {
  
   final emailc = TextEditingController();
  bool isLoading = false;
   String passvalue1 ="";
   String passvalue2 ="";
   final fullname = TextEditingController();

  final passc = TextEditingController();
@override
  void dispose() {
    emailc.dispose();
    passc.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  Widget build(BuildContext context) {
    validate(){
      setState(() {
        
      });
    }
    register() async{
      setState(() {
        isLoading = true;
      });
      try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailc.text,
    password: passc.text,
  );
  CollectionReference users =FirebaseFirestore.instance.collection('Applicants');

        users
            .doc(credential.user!.uid)
            .set(
              {
                'fullName': fullname.text,
                'Email': emailc.text,
                'password': passc.text,
              },
            )
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    final snackBar = SnackBar(
            content: const Text('The password provided is too weak.'),
            action: SnackBarAction(
              label: 'close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
  } else if (e.code == 'email-already-in-use') {
     final snackBar = SnackBar(
            content: const Text('The account already exists for that email.'),
            action: SnackBarAction(
              label: 'close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
  }
} catch (e) {
  print(e);
}
 setState(() {
        isLoading = false;
      });
    }
     return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
         margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: SizedBox(
            width: 349,
            child: Text(
              'Sign up as applicant',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'El Messiri',
                fontWeight: FontWeight.w700,
                height: 1.44,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
                        // we return "null" when something is valid
                       validator: (value) {
                            return !value.toString().isEmpty
                                ? null
                                : "Empty";
                          },
                          controller: fullname,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        decoration:const InputDecoration(
                            hintText: "Enter your full name : ",
                            suffixIcon: Icon(Icons.account_box_rounded))),
                  SizedBox(height: 10,),
                  TextFormField(
                        // we return "null" when something is valid
                        validator: (email) {
                          return email!.contains(RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                              ? null
                              : "Enter a valid email";
                        },
                        
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailc,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration:const InputDecoration(
                            hintText: "Enter Your Email : ",
                            suffixIcon: Icon(Icons.email))),
                            SizedBox(height: 10,),
                            TextFormField(
                        // we return "null" when something is valid
                        validator: (passc) {
                          return passc!.contains(RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))
                              ? null
                              : "Enter a valid password (should contain at least one upper case \n,at least one lower case , at least one digit ,\n at least one Special character , at least 8 characters in length )";
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        
                        controller: passc,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration:const InputDecoration(
                            hintText: "Enter Your password : ",
                            suffixIcon: Icon(Icons.password))),
                            SizedBox(height: 10,),
                            TextFormField(
                        // we return "null" when something is valid
                        validator: (value) {
                          return passc.text.compareTo(value.toString())==0
                              ? null 
                              : "Different password";
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration:const InputDecoration(
                            hintText: "Enter Your password : ",
                            suffixIcon: Icon(Icons.password))),
                        SizedBox(height: 20,),
       ElevatedButton (
                      onPressed: () async {
                        
                         await register();
                         if(!mounted) return;
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginApplicants()));
                        
                      },
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Register",
                              style: TextStyle(fontSize: 19),
                            ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF2d365c)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    SizedBox(height: 20,),
      Container(
          width: 350,
          height: 30,
          margin: EdgeInsets.fromLTRB(50, 20, 0, 0),
          child: Row(
              children: [
                Text(
                   'Already have an account ? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                InkWell(child:Text(
                  
                   'Sign in',
                  style: TextStyle(
                    color: Color(0xFF2d365c),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    
                  ),
                   ),
                onTap: () { Navigator.pushNamed(context, '/login');},)

              ]
            )
        ),
      





                ],



              )



            ),
          ),
        ),
      ),
    );
  }
}