import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CurvedNavigationBar(
        height: 52,
        backgroundColor: PrimaryColor,
            key: _bottomNavigationKey,
            items: <Widget>[
              Icon(Icons.home, size: 25),
              Icon(Icons.chat, size: 25),
              Icon(Icons.notifications, size: 25),
            ],
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
    );

  }
}
