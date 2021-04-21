import 'package:dapp/Screens/payment/components/card/Credit.dart';
import 'package:dapp/Screens/payment/detail_card.dart';
import 'package:dapp/models/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../constraints.dart';
import 'detail_header.dart';

class DetailPage extends StatefulWidget {
  final CreditCard card;

  const DetailPage({Key key, @required this.card}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double sheetProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: PrimaryColor,
            size: SizeConfig.defaultHeight * 4,
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: SizeConfig.defaultWidth * 2),
        //     child: Icon(
        //       Icons.share,
        //       color: Colors.white,
        //       size: SizeConfig.defaultHeight * 4,
        //     ),
        //   )
        // ],
      ),
      body:
            Stack(
              alignment: Alignment.topCenter,
              children: [
                PlayAnimation(
                    tween: Tween(begin: SizeConfig.defaultHeight * 20, end: 0.0),
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 200),
                    builder: (context, child, value) => Transform.translate(
                      offset: Offset(0, value),
                      child: child,
                    ),
                    child: DetailHeader(sheetProgress: sheetProgress)),
                PlayAnimation(
                    tween: Tween(begin: 0.2, end: 1.0),
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 200),
                    builder: (context, child, value) =>
                        Transform.scale(
                          scale: value,
                          alignment: Alignment.center,
                          child: Opacity(opacity: value, child: child),
                        ),
                    child:
                    DetailCard(sheetProgress: sheetProgress, card: widget.card),
                ),
                _buildBottomSheet(),
              ]
      ),
    );
  }
  _buildBottomSheet() => PlayAnimation(
    tween: Tween(begin: SizeConfig.defaultHeight , end: 0.0),
    curve: Curves.easeOut,
    duration: Duration(milliseconds: 200),
    builder: (context, child, value) => Transform.translate(
      offset: Offset(0, value),
      child: child,
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 440),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Crid())),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.9,
          decoration: BoxDecoration(
              color: PrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
          child: Center(
            child: Text("Select This Card",
                style: const TextStyle(
                    color: const Color(0xfffefefe),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0)),
          ),
        ),
      )
    ),


  );
}


