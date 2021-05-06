import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dapp/constraints.dart';
class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  int selectedDate = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F35A5).withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                height: 210,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 200,
                        height: 210,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/folio.png'),
                                fit: BoxFit.contain
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Folio Studio", style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'product'
                      ),),
                      SizedBox(height: 5,),
                      Text("Thrissur", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'circe'
                      ),),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text("4.9 Rating", style: GoogleFonts.notoSans(color: Colors.white),)
                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 10),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About", style: GoogleFonts.notoSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 10,),
                    Text("     Folea Studio Pvt ltd, earlier Known as Epic Studios, founded by Jeemon Pullelly in 2016, a veritable name in the stereoscopic world, has been behind some of the best known 3D movies from India. We are one of the global leaders in converting 2D to 3D works with comprehensive technical solutions from pre to post-production. Unsurprisingly so, the studio has worked in more than ten 3D movies, not to mention the Hollywood projects fine-tuned. Led by a talented team of experts Folea Studios is also a forerunner in the field of 3D Advertising and Corporate Videos in India. Folea's in-house team of experienced animators is involved from concept to creation and is focused on attention to detail with a portfolio ranging from animation video to advertising. The team is capable of conceiving and executing tailor made projects to the specific needs of clients and focuses on delivering services which exceed their expectation. ",
                      style: GoogleFonts.itim(fontSize: 16,),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20,),
                    Text("Services by Folio Studio", style:
                    GoogleFonts.notoSans(fontSize: 20,fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            courseWidget("photoshoot", "Photoshoot",  lightBlue, darkBlue),
                            courseWidget("wedding", "Wedding \nPhotography",  lightyellow, Color(0xff4d4d4d)),
                            courseWidget("birthday", "Birthday \nPhotography", pink, Color(0xff4a155f))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Availability", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'product'
                    ),),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for(int i=0; i < 20; i++)
                            dateWidget(i),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              timeSlotWidget("11:00 AM", false),
                              timeSlotWidget("12:00 PM", false),
                              timeSlotWidget("01:00 PM", false),
                              timeSlotWidget("03:00 PM", true),
                            ],
                          ),
                          Row(
                            children: [
                              timeSlotWidget("04:00 PM", false),
                              timeSlotWidget("06:00 PM", false),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF6F35A5)
              ),
              child: Center(
                child: Text("Make an Appoinment", style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'circe',
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
  Container timeSlotWidget(String time, bool isSelected)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: (isSelected) ? pink : lightBlue.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Icon(
            Icons.watch_later,
            size: 13,
            color: Colors.grey,
          ),
          SizedBox(width: 3,),
          Text(time, style: TextStyle(
              fontSize: 10,
              fontFamily: 'circe'
          ),)
        ],
      ),
    );
  }
  InkWell dateWidget(int i)
  {
    DateTime tempDate = DateTime.now().add(Duration(days: i));
    return InkWell(
      onTap: (){},
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(2),
          height: 60,
          width: MediaQuery.of(context).size.width*0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: (selectedDate == tempDate.day) ? pink : lightBlue.withOpacity(0.5),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dayValue(tempDate.weekday), style: TextStyle(
                    fontSize: 10
                ),),
                Text(tempDate.day.toString(), style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
        ),
      ),
    );

  }
  String dayValue(int weekDayVal)
  {
    List<String> dayString = ['', "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", 'Sun'];
    return dayString[weekDayVal];
  }


  Container courseWidget(String img, String name, Color color, Color textColor)
  {
    return Container(
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name, style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                ),),
                // Text(grade, style: TextStyle(
                //     color: Colors.grey,
                //     fontSize: 11
                // ),)
              ],
            ),
          ),
          Container(
            height: 100,
            width: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/$img.png'),
                    fit: BoxFit.contain
                )
            ),
          )
        ],
      ),
    );
  }
}