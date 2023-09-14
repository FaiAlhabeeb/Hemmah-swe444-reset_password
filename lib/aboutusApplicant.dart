import 'package:flutter/material.dart';

import 'SettingsC.dart';





class aboutus extends StatefulWidget {
  
  const aboutus ({super.key});


  @override
  State<aboutus> createState() => _aboutusState();
}

 
class _aboutusState extends State<aboutus> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
appBar:AppBar(
     
  backgroundColor:Colors.white,
 
 leading:IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed:() {
      Navigator.push(context,MaterialPageRoute(builder: (context) => SettingsC()));
        
      }
    ),
      title:
        Text('About Us',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          
          ),
    
          
        ),
    
      ),
body: 
 SingleChildScrollView(child: 
       Column(
    
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [


      SizedBox(width:400),
      SizedBox(height:60),
    
Stack(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundColor: Colors.grey.shade200,
          child: CircleAvatar(
            radius: 70,
           
            backgroundImage:NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg"),
       
          ),
        ),
      ],
),


SizedBox(height: 40,),
Container(
      height: 300,
      width: 350,
      decoration: BoxDecoration(
      color: Color(0xFFF4F4F4),
       borderRadius: BorderRadius.circular(60),
      ),
      alignment: Alignment.bottomLeft,
     
        child: Align(
          alignment: Alignment.center,
          
          child: Text(
            "Hemmah is an application that connects employee in the public and private sectors and people with special needs, In order to contribute to their empowerment by participating in the development of the homelands, so that people with special needs can be empowered by developing their abilities and skills  , It is an application that helps people with special needs to find jobs that suit them.   As mentioned above, Hemma's goal is to save time and effort for job seekers with special needs and companies that wish to hire this category."
            ,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
          
                    
            ),
          ),
        ),
      ),
    
  



    ],
),
    
  
       ),
 
    );
  }
}