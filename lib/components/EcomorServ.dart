import 'package:dapp/Screens/Products.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EcomorServ extends StatelessWidget {
  final String assetName = 'assets/online.svg';
  @override
  Widget build(BuildContext context) {

    Widget drawCircles() {
      var heightOfScreen = MediaQuery.of(context).size.height;
      var widthOfScreen = MediaQuery.of(context).size.width;
      return Column(
        children: <Widget>[
          CustomPaint(
            painter: DrawCircle(
              offset: Offset(widthOfScreen * 0.2, heightOfScreen * 0.05),
              radius: widthOfScreen * 0.24,
              color: PrimaryColor,
              hasShadow: true,
              shadowColor: Colors.green,
            ),
          ),
          CustomPaint(
            painter: DrawCircle(
              offset: Offset(widthOfScreen * 0.75, heightOfScreen * 0.04),
              radius: widthOfScreen * 0.5,
              color: PrimaryColor,
              hasShadow: true,
              shadowColor: Colors.green,
            ),
          ),

        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            drawCircles(),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 240,left: 10,),
                        child: Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadow,
                                border: new Border.all(
                                  color:PrimaryColor,
                                ),
                                shape: BoxShape.circle,
                              ),
                               child: SvgPicture.asset("assets/online.svg",fit: BoxFit.cover,width: 160,),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("Looking for a product...",style: GoogleFonts.caveat(
                                fontWeight: FontWeight.bold,fontSize: 18
                              ),),
                            ),
                            SizedBox(height: 10,),

                            Container(
                              decoration: BoxDecoration(
                                boxShadow: shadow,
                                borderRadius: BorderRadius.circular(50),
                              ),
                             child: RaisedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                },
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                textColor: Colors.white,
                                color: PrimaryColor.withOpacity(0.8),
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Go",
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 240,left: 20),
                        child: Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadow,
                                border: new Border.all(
                                  color: PrimaryColor,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset("assets/photo.svg",fit: BoxFit.cover,width: 160,),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("Looking for a Service...",style: GoogleFonts.caveat(
                                  fontWeight: FontWeight.bold,fontSize: 18
                              ),),
                            ),
                            SizedBox(height: 10,),

                            Container(
                                child: FlatButton(
                                  onPressed: null,
                                  child: Text('Go', style: TextStyle(
                                      color: PrimaryColor
                                  )
                                  ),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(side: BorderSide(
                                      color: PrimaryColor,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ), borderRadius: BorderRadius.circular(50)),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
