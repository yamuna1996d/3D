import 'dart:developer';
import 'package:dapp/constraints.dart';
import 'package:dapp/models/ServiceModel.dart';
import 'package:flutter/material.dart';
class ServiceCard extends StatelessWidget {

  const ServiceCard({
    Key key,
    this.services,
    this.press

  }) : super(key: key);
  final Services services;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.all(20),
          height: 180,
          width: 160,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,

              color: PrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.network(services.image,fit: BoxFit.cover,),

        ),
        Padding(
          padding: const  EdgeInsets.symmetric(vertical:5),
          child: Text(services.sname,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),),
        )
      ],
    );
  }
}

