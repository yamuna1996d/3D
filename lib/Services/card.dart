import 'package:flutter/material.dart';

import 'detailpage.dart';

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4-15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: stylist['bgColor'],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 15,
              right: -38,
              child: Image.asset(
                stylist['imgUrl'],
                width: MediaQuery.of(context).size.width * 0.58,
                height: MediaQuery.of(context).size.height * .18,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    stylist['StudioName'],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    stylist['place'],
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xff4E295B),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        stylist['rating'],
                        style: TextStyle(
                          color: Color(0xff4E295B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherPage()));
                    },
                    color: Color(0xff4E295B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
