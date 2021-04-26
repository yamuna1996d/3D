import 'package:dapp/NavBar_Components/user_profile/Change_Password.dart';
import 'package:dapp/NavBar_Components/whishlist_products.dart';
import 'package:dapp/Screens/address/add_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constraints.dart';

class UserAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      IconButton(icon:Icon(Icons.arrow_back,color: Colors.black,),
                          onPressed:(){
                            Navigator.pop(context);
                          }),
                      SizedBox(width: 10,),
                   SvgPicture.asset(
                    "assets/icons/users.svg",
                    color: PrimaryColor,
                         width: 17,
                     ),
                      SizedBox(width: 10,),
                      Text("Account",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),)
                    ],

                  ),
                ),
              ),
             // SizedBox(height: 20,),

              SizedBox(height: 20,),
              AccountSettings(
                text: "Your Orders",
                //icon: "assets/icons/users.svg",
                press: () => {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserAccount()))
                },
              ),
              AccountSettings(
                text: "Add Address",
                //icon: "assets/icons/bell.svg",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressPage()));
                },
              ),
              AccountSettings(
                text: "Whishlist",
                 //icon: "assets/icons/settings.svg",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyWishlist()));
                },
              ),
              AccountSettings(
                text: "Change Password",
                //icon: "assets/icons/social-care.svg",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordChange()));
                },
              ),

            ],
          )
      ),
    );
  }
}



class AccountSettings extends StatelessWidget {
  const AccountSettings({
    Key key,
    @required this.text,
    //@required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: PrimaryColor.withOpacity(0.04),
        onPressed: press,
        child: Row(
          children: [
            // SvgPicture.asset(
            //   icon,
            //   color: PrimaryColor,
            //   width: 22,
            // ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
