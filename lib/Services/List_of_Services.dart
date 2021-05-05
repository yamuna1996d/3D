import 'package:dapp/Services/Service_Card.dart';
import 'package:dapp/constraints.dart';
import 'package:dapp/models/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class ServiceList extends StatelessWidget {
  const ServiceList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor:backgroundColor,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed:(){
          Navigator.pop(context);
            }),
        elevation: 0,

        title: Text("Our Services",style: TextStyle(
          color: Colors.black
        ),),
      ),
      body:Container(
        margin: EdgeInsets.all(10),
        child: Column(
          
          children: [
            //SizedBox(height: 10,),
            Expanded(child: GridView.builder(
              itemCount: services.length,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder:(context, index) => ServiceCard(services: services[index],),
            )
            )
          ],
        ),
      )
    );

  }
}
