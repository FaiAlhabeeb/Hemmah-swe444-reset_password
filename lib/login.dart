import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'reset_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hemmah/homepage.dart';



class Login extends StatefulWidget {
    Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final  emailp = TextEditingController();
  bool isLoading = false;
    final  passp = TextEditingController();
  @override
  void dispose() {
    emailp.dispose();
    passp.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  Widget build(BuildContext context) {
    

        Future<bool> login() async {
      try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailp.text,
    password: passp.text,);
     return true;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
     final snackBar = SnackBar(
            content: const Text('No user found for that email.'),
            action: SnackBarAction(
              label: 'close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  } else if (e.code == 'wrong-password') {
    final snackBar = SnackBar(
            content: const Text('Wrong password provided for that user.'),
            action: SnackBarAction(
              label: 'close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  } else return false;
}
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
              'Log in',
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
        
                  SizedBox(height: 10,),
                  TextFormField(
                        // we return "null" when something is valid
                        validator: (value) {
                          return !value.toString().isEmpty
                              ? null
                              : "Empty";
                        },
                        
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailp,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration:const InputDecoration(
                            hintText: "Enter Your Email : ",
                            suffixIcon: Icon(Icons.email))),
                            SizedBox(height: 10,),
                            TextFormField(
                        // we return "null" when something is valid
                        validator: (value) {
                          return !value.toString().isEmpty
                              ? null
                              : "Empty";
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        
                        controller: passp,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration:const InputDecoration(
                            hintText: "Enter Your password : ",
                            suffixIcon: Icon(Icons.password))),
                            SizedBox(height: 10,),
                            
                        SizedBox(height: 20,),
       ElevatedButton (
                      onPressed: () async {
                        bool x;
                          x=await login();
                         if(!mounted) return;
                         if (x){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  homepage()));
                         }
                        
                      },
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
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
                   'you dont have an account ? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                InkWell(child:Text(
                  
                   'Sign up',
                  style: TextStyle(
                    color: Color(0xFF2d365c),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    
                  ),
                   ),
                onTap: () { Navigator.pushNamed(context, '/userchoice');},)

              ]
            )
        ),

      
      Container(
        
        
          
          child: TextButton(
            child:Text("Forget Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2d365c),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                )
            )  ,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
              );
            },)),



                ],



              )



            ),

          ),
        ),
      ),
    );
  }
}