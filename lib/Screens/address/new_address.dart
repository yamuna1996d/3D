import 'package:dapp/Screens/address/add_address_page.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
             onPressed: (){Navigator.pop(context);}),
         backgroundColor:backgroundColor,
         elevation: 0,
       ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("My Address",style: TextStyle(
              fontSize: 20
            ),),
            SizedBox(height: 20,),
            Row(
              children: [
                IconButton(icon: Icon(Icons.add,color:PrimaryColor,size: 25,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressPage()));
                    }),
               // SizedBox(width: 3,),
                Text("Add Address",style: TextStyle(
                  fontSize: 15
                ),)
              ],
            ),
            Divider(thickness: 1,),

          ],

        ),
      ),
    );
  }
}
