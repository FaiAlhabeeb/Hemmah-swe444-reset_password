import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     body: Container(
  width: double.infinity,
  height: double.infinity,
  clipBehavior: Clip.antiAlias,
  decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: Stack(
    children: [
      
        Container(
         margin: EdgeInsets.fromLTRB(35, 400, 0, 0),
          child: SizedBox(
            width: 349,
            child: Text(
              'Welcome to Hemmah',
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
      
      
         Positioned(
          left: 45,
          right: 45,
          top: 516,
          child: SizedBox(
            width: 324,
            child: Text(
              'Hemmah app helps special needs to find jobs easly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'El Messiri',
                fontWeight: FontWeight.w500,
                height: 1.38,
              ),
            ),
          ),
        ),
      
      InkWell(
        
        child: Container(
          margin: EdgeInsets.fromLTRB(120, 600, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: ShapeDecoration(
            color: Color(0xFF2d365c),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Get started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'El Messiri',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      onTap: () {
         Navigator.pushNamed(context, '/userchoice');
      },),
      
      Positioned(
        left: 26,
        top: 76,
        child: Container(
          width: 300,
          height: 300,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Container(
                margin: EdgeInsets.only(left: 50),
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/hemmah.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
)
             
      );
  }
}