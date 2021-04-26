import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  SelectLocationParameters args;
  bool progress = false;
  String country, state, district, localityType = "PANCHAYATH",panchayath;
  String selectedDistrict = "SELECT DISTRICT";
  String selectedLocality = "SELECT PANCH / MUN / CORP";
  String locType = "PANCH / MUN /CORP";
  List<String> locSelect = ["PANCHAYATH","MUNICIPALITY","CORPORATION"];
  List<String> districts = ["Alappuzha","Ernakulam","Idukki",
    "Kannur" ,"Kasaragod","kottayam","Kollam","Kozhikode","Malappuram","Palakkad", "Pathanamthitta","Thrissur","Thiruvananthapuram","Wayanad",];
  List<dynamic> localities = [];
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

    return Scaffold(
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: PrimaryColor,
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    InkWell(onTap : (){
                      Navigator.pop(context);
                    },child: Icon(Icons.arrow_back,color: Colors.white,)),
                    SizedBox(height: 20,),
                    Center(child: Text("Select Location",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5,fontSize: 20,),)),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Center(child: Text("Select your district,",style: TextStyle(fontSize:16,fontWeight: FontWeight.w300))),
                      Center(child: Text("panchayath / Municipality / corporation",style: TextStyle(fontSize:16,fontWeight: FontWeight.w300))),
                      SizedBox(height: 40,),
                      Container(
                        width: double.infinity,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: new Border.all(color: Colors.lightGreen)),
                        child: FlatButton(
                          onPressed: () {
                          },
                          child: Text("KERALA",style: TextStyle(color: Colors.grey[500],fontSize: 12,letterSpacing: 1),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: new Border.all(color: Colors.lightGreen)),
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: DistrictList(),
                                  );
                                });
                          },
                          child: Text(selectedDistrict.toUpperCase(),style: TextStyle(color: Colors.grey[500],fontSize: 12,letterSpacing: 1)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: new Border.all(color: Colors.lightGreen)),
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: LocalityList(),
                                  );
                                });
                          },
                          child: Text(locType.toUpperCase(),style: TextStyle(color: Colors.grey[500],fontSize: 12,letterSpacing: 1)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: new Border.all(color: Colors.lightGreen)),
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: chapterList(),
                                  );
                                });
                          },
                          child: Text(selectedLocality.toUpperCase(),style: TextStyle(color: Colors.grey[500],fontSize: 12,letterSpacing: 1)),
                        ),
                      ),
                      progress ? LinearProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),backgroundColor: Colors.lightGreen) : Container(),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          color: PrimaryColor,
                          onPressed: (){
                            if(selectedDistrict =="SELECT DISTRICT"){
                              showDialog(context: context,builder: (BuildContext context){
                                return AlertDialog(
                                  content: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.warning,color: Colors.red,size: 64,),
                                        SizedBox(height: 20,),
                                        Text("Please select district to continue",textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                );
                              });

                            }else if(selectedLocality == "SELECT PANCHAYATH" || selectedLocality == "SELECT MUNICIPALITY" || selectedLocality == "SELECT CORPORATION" || selectedLocality == "SELECT PAN / MUN / CORP"){
                              showDialog(context: context,builder: (BuildContext context){
                                return AlertDialog(
                                  content: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.warning,color: Colors.red,size: 64,),
                                        SizedBox(height: 20,),
                                        Text("Please select your Pan / Mun / Corp to continue",textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                );
                              });

                            }else{
                             // Navigator.pushNamed(context, "/registration",arguments: RegistrationArguments(district: selectedDistrict,chapter : selectedLocality,pincode: args.pincode,po: args.po));
                            }

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Text("CONTINUE",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )),
    );
  }
  Widget LocalityList() {
    return Container(
      height: 150,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
//              padding: EdgeInsets.only(left: 10,right: 10),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      locType = locSelect[index];
                      selectedLocality = "SELECT " + locType;
                      print(locType);
                      Navigator.of(context).pop();

//                    getLocalities();
                    });
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(locSelect[index].toUpperCase(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.normal,fontSize: 15,letterSpacing: 1),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.grey,),
                      SizedBox(height: 10,),
                    ],
                  )),
            );
          }),
    );
  }
  Widget DistrictList() {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: districts.length,
          itemBuilder: (context, index) {
            return Container(
//              padding: EdgeInsets.only(left: 10,right: 10),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedDistrict = districts[index];
                      Navigator.of(context).pop();
                      getLocalities();
                    });
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(districts[index].toUpperCase(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                    ],
                  )),
            );
          }),
    );
  }
  Widget chapterList() {
    List<dynamic> locList = [];
    for(int i=0;i<localities.length;i++){
      if(localities[i]['type'] == locType ){
        locList.add(localities[i]);
      }
    }
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: locList.length,
          itemBuilder: (context, index) {
            return Container(
//              padding: EdgeInsets.only(left: 10,right: 10),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedLocality = locList[index]['name'];
                      Navigator.of(context).pop();
                    });
                  },
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(locList[index]['name'].toString().toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                    ],
                  )),
            );
          }),
    );
  }

  void getLocalities() async {
    setState(() {
      progress = true;
    });
    var url = Uri.parse("http://65.0.174.90:5000/api/v1/localities?district=" + selectedDistrict);
    http.Response response = await http.get(url
//          Config.BASE_URL + "/localities?district="+ selectedDistrict
    );
    setState(() {
      localities = jsonDecode(response.body);
      progress = false;
    });
  }
}

class SelectLocationParameters{
  String pincode;
  String po;
  SelectLocationParameters({this.pincode,this.po});
}
