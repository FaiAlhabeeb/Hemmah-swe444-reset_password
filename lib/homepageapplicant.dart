import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hemmah/GetDatafromApplicant.dart';
import 'package:hemmah/applicantProfile.dart';
class homepageapplicant extends StatefulWidget {
   homepageapplicant({super.key});

  @override
  State<homepageapplicant> createState() => _homepageapplicantState();
}

class _homepageapplicantState extends State<homepageapplicant> {
  final credintial = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){} , backgroundColor: Colors.brown.shade700  ,
      child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart , color: Colors.white60,)),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: GNav(
        color: Colors.white,
        backgroundColor: Colors.black,
        activeColor: Colors.red.shade800,
        selectedIndex: 0,
        tabs: [
        GButton(icon: Icons.store , iconColor: Colors.brown, onPressed: (){ }, ),
        GButton(icon: Icons.map , iconColor: Colors.brown,onPressed: (){ }, ),
        GButton(icon: Icons.announcement_sharp, iconColor: Colors.brown, ),
        GButton(icon: Icons.message , iconColor: Colors.brown,),
        GButton(icon: Icons.account_box , iconColor: Colors.brown,onPressed: (){  Navigator.push(context,MaterialPageRoute(builder: (context) =>const componyProfile()));},),
      ]),
    

       // ontapechange: (index) { home i 0 azed ala a5r wa7d}

      
      
      appBar: AppBar(
        title: Text("" , style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed:() {
            
          }, icon: Icon(Icons.search)),
          GestureDetector(child: IconButton(onPressed:() {
            Navigator.pushNamed(context, '/');
          }, icon: Icon(Icons.logout)) , ),
        ],
      ),
      
      
      body: SingleChildScrollView (child: Column(
        children: [
           
           Container( margin: EdgeInsets.fromLTRB(20, 200, 20, 0),
             child: ElevatedButton(onPressed: (){  
              FirebaseAuth.instance.signOut();
           
             }, child: Text("sign out")),
           ),
          
           
           Text("email: ${credintial?.email}"),
           Text("password: ${credintial?.uid}"),
           GetdatafromApplicant(documentId: credintial!.uid ),

                    
                 
                     
                      SizedBox(height: 100,),
                
                    
                 
                ],
          
          
              ),
          
          
                
              ),
          
       
     
      
      );
  }
}