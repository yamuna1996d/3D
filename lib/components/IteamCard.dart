import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constraints.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key key,
    this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(DefaultPadding / 2),
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        //boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 15),
        //     blurRadius: 22,
        //     color: PrimaryColor.withOpacity(0.22),
        //   ),
        //   BoxShadow(
        //     offset: Offset(-15, -15),
        //     blurRadius: 20,
        //     color: Colors.white,
        //   ),
        // ],
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
