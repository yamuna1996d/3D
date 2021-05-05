import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';


class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Notification',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CloseButton()
                ],
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              SizedBox(
                                height: 110,
                                width: 110,
                                child: Stack(children: <Widget>[

                                  Positioned(
                                    top: 8.0,
                                    left: 10.0,
                                    child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            'assets/car/1.jpeg')),
                                  )
                                ]),
                              ),
                              Flexible(
                                child: Column(children: [
                                  Text(
                                      'Sony Camera',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                  SizedBox(height:4.0),
                                  Text(
                                      'Your package has been delivered. Thanks for shopping!',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10))
                                ]),
                              )
                            ]),
                          ),
                          InkWell(
                            // onTap: () => Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (_) => RatingPage())),
                            child: Container(
                                padding: const EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0))),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Share your feedback',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    // Track the product.
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              SizedBox(
                                height: 110,
                                width: 110,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    top: 8.0,
                                    left: 10.0,
                                    child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            "assets/images/b.jpg")),
                                  )
                                ]),
                              ),
                              Flexible(
                                child: Column(children: [
                                  Text(
                                      'Flash Transmitter / Sync Lead',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                  SizedBox(height:4.0),
                                  Text(
                                      'Your package has been dispatched. You can keep track of your product.',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10))
                                ]),
                              )
                            ]),
                          ),
                          InkWell(
                            // onTap: () => Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (_) => )),
                            child: Container(
                                padding: const EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Track the product',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
