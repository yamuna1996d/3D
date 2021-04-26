import 'package:dapp/Screens/Products.dart';
import 'package:dapp/Screens/SelectLocation.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor,

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
           SizedBox(height: 70,),
             Padding(
               padding: EdgeInsets.only(top: 70,left: 60,right: 10),
               child: SizedBox(
                 height: 50,
                 width: 100,
                 child: DefaultTextStyle(
                   style: const TextStyle(
                     color: PrimaryColor,
                     fontSize: 40.0,
                   ),
                   child: AnimatedTextKit(
                     animatedTexts: [
                       WavyAnimatedText('Welcome'),

                       //WavyAnimatedText(''),
                     ],
                     repeatForever: true,
                     isRepeatingAnimation: true,
                     onTap: () {
                       print("Tap Event");
                     },
                   ),
                 ),
               ),
             ),

              Padding(padding: EdgeInsets.only(left: 30,right: 25,top: 130),
              child: Column(
                children: [


                  SizedBox(
                    height: 60,
                    width: 300,
                    child: RaisedButton(
                         elevation: 0,
                      color: PrimaryColor,
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(50)
                      ),
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLocation()));
                      },
                      child: Text("Login",style: TextStyle(color:backgroundColor,fontSize: 20),),),
                  ),
                 SizedBox(height: 20,),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: RaisedButton(
                      elevation: 0,
                      color: backgroundColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color:PrimaryColor),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLocation()));
                      },
                      child: Text("Register",style: TextStyle(color:PrimaryColor,fontSize: 20),),),
                  ),
                ],
              ),

              ),

            // Expanded(
            //   child: Align(
            //     child: ClipPath(
            //       child: Container(
            //         color:  PrimaryColor,
            //         height: 300,
            //       ),
            //       clipper: BottomWaveClipper(),
            //     ),
            //     alignment: Alignment.bottomCenter,
            //   ),
            // )
            Expanded(
                child:Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                         height:500,
                        width: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(300),

                            ),

                          boxShadow: [
                            BoxShadow(color:Colors.black.withOpacity(0.5),
                            blurRadius: 50,),
                          ],

                          color: PrimaryColor,


                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 170, top:170 ),
                      child: Container(
                        height:90,
                        width: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(200),
                            topLeft: Radius.circular(200),

                          ),

                          boxShadow: [
                            BoxShadow(color:Colors.black.withOpacity(0.4),
                              blurRadius: 50,),
                          ],


                          color: PrimaryColor,


                        ),
                      ),
                    ),

                  ],
                ) ),
          ],
        ),
      ),
    );
  }
}



class BottomWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 0);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
  
}

