import 'package:dapp/Screens/MyBag.dart';
import 'package:dapp/Screens/Products.dart';
import 'package:flutter/material.dart';

import '../constraints.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            "assets/success.png",
            height: 400,
          ),
          SizedBox(height: 90),
          Text(
            "Order Placed",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 300,
            height: 50,
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: PrimaryColor,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: Text(
                "Go Back ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}