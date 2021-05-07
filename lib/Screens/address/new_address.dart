import 'package:dapp/components/IteamCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _formGlobalKey=GlobalKey();

  TextEditingController _state=TextEditingController();
  TextEditingController _city=TextEditingController();
  TextEditingController _name=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _house=TextEditingController();
  TextEditingController _landmark=TextEditingController();
  TextEditingController _district=TextEditingController();
  TextEditingController _pincode=TextEditingController();

  List name =[];
  List city=[];
  List house=[];
  List pin=[];
  List district =[];
  List phone =[];
  List landmark =[];



  FocusNode _phoneFocusNode, _nameFocusNode,_houseFocusNode,_districtFocusNode,_landmarkFocusNode,_productFocusNode,
      _stateFocusNode,_cityFocusNode,_pincodeFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneFocusNode=FocusNode();
    _nameFocusNode=FocusNode();
    _houseFocusNode=FocusNode();
    _pincodeFocusNode=FocusNode();
    _landmarkFocusNode=FocusNode();
    _districtFocusNode=FocusNode();
    _productFocusNode=FocusNode();
    _stateFocusNode=FocusNode();
    _cityFocusNode=FocusNode();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneFocusNode=FocusNode();
    _nameFocusNode=FocusNode();
    _houseFocusNode=FocusNode();
    _pincodeFocusNode=FocusNode();
    _landmarkFocusNode=FocusNode();
    _districtFocusNode=FocusNode();
    _productFocusNode=FocusNode();
    _stateFocusNode=FocusNode();
    _cityFocusNode=FocusNode();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: (){Navigator.pop(context);}),
        backgroundColor:Colors.white,
        elevation: 0,
        title:Text("My Address",style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black
        )),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Text("My Address",style: TextStyle(
              //   fontSize: 20
              // ),),
              SizedBox(height: 20,),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.add,color:PrimaryColor,size: 25,),
                      onPressed: ShowBottomSheet
                  ),
                  // SizedBox(width: 3,),
                  Text("Add Address",style: TextStyle(
                      fontSize: 15
                  ),)
                ],
              ),
              Divider(thickness: 1,),
              ListView.builder(
                shrinkWrap: true,
                itemCount:city.length==null ? 0 : city.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: shadow
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset("assets/ho.png",height: 45,width: 50,),
                        trailing: GestureDetector(
                            onTap: (){

                              //print("delete checked"+index.toString());
                              setState(() {
                                name.removeAt(index);
                                city.removeAt(index);
                                house.removeAt(index);
                                district.removeAt(index);
                                phone.removeAt(index);
                                landmark.removeAt(index);

                              });
                            },
                            child: Icon(Icons.delete_sharp, color:Colors.red)
                        ),

                        title: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(name[index].toString(),style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.bold
                          )),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 2,bottom: 5),
                          child: Text(house[index].toString()+","+city[index].toString()+","+" "+ district[index].toString()
                              +",\n"+landmark[index].toString()+"\npin: " + pin[index] +",\n"+phone[index],
                          style: GoogleFonts.itim(),),
                        ),
                      ),
                    ),
                  );

                },),
              //Divider()

            ],

          ),
        ),
      ),
    );
  }

  Widget ShowBottomSheet(){
    _scaffoldKey.currentState.
    showBottomSheet((context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right:25,left: 25,bottom: 5),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Form(
                  key: _formGlobalKey,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _name,
                        autofocus: true,
                        focusNode: _nameFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },
                        decoration: InputDecoration(

                          labelText: "Name",
                          hintText: "Full Name (Required) *",


                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),

                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _phone,
                        focusNode: _phoneFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Ph No.",
                          hintText: "Phone Number (Required) *",

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length!=10) {
                            return 'Enter a valid phone number';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(

                              controller:_pincode,
                              focusNode:_pincodeFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_nameFocusNode);
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                              ],
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(

                                labelText: "Pin Code",
                                hintText: "Pin Code (Required)*",

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.grey, width: 1.0),
                                ),
                              ),

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your Pin Code';
                                }
                                return null;
                              },
                            ),
                            flex: 4,
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child:GestureDetector(
                              onTap: (){
                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>GpsUser()));
                              },
                              child: Container(
                                height: 40,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: PrimaryColor.withOpacity(0.5)

                                ),
                                child:Row(
                                  children: [
                                    SizedBox(width: 5,),
                                    Icon(Icons.my_location, color: backgroundColor,size: 20,),
                                    SizedBox(width: 5,),
                                    Text("Use my location",style: TextStyle(
                                      color: backgroundColor,
                                      fontSize: 15,

                                    ),)
                                  ],

                                ),

                              ),
                            ),

                            flex: 4,
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(

                              controller:_state,
                              focusNode:_stateFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_nameFocusNode);
                              },

                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(

                                labelText: "State",
                                hintText: "State",

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.grey, width: 1.0),
                                ),
                              ),

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your State';
                                }
                                return null;
                              },
                            ),
                            flex: 4,
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextFormField(
                              controller: _city,
                              focusNode: _cityFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_nameFocusNode);
                              },
                              // inputFormatters: [
                              //   LengthLimitingTextInputFormatter(5),
                              // ],
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(


                                hintText: "City (Required) *",
                                labelText: "City",

                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.grey, width: 1.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your City';
                                }
                                return null;
                              },
                            ),
                            flex: 4,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _house,
                        focusNode: _houseFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },

                        decoration: InputDecoration(

                          hintText: "House No",
                          labelText: "House",

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your House No';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _district,
                        focusNode:_districtFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },
                        decoration: InputDecoration(


                          hintText: "District",
                          labelText: "District",

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your district';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _landmark,
                        focusNode: _landmarkFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },
                        decoration: InputDecoration(


                          hintText: "Landmark",
                          labelText: "Landmark",

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your locality';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20,),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).padding.bottom == 0
                                    ? 20
                                    : MediaQuery.of(context).padding.bottom),
                            child: InkWell(

                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 1.5,
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
                                  child: Text("Proceed",
                                      style: const TextStyle(
                                          color: const Color(0xfffefefe),
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.0)),
                                ),
                              ),

                              onTap: (){
                                var getName = _name.text.toString();
                                var getHouse= _house.text.toString();
                                var getCity=_city.text.toString();
                                var getPin=_pincode.text.toString();
                                var getDistrict= _district.text.toString();
                                var getLandmark = _landmark.text.toString();
                                var getPhone = _phone.text.toString();

                                final FormState form = _formGlobalKey.currentState;
                                if(form.validate()){
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSuccess()));

                                  setState(() {
                                    name.add(getName);
                                    city.add(getCity);
                                    house.add(getHouse);
                                    pin.add(getPin);
                                    district.add(getDistrict);
                                    landmark.add(getLandmark);
                                    phone.add(getPhone);

                                  });
                                  Navigator.pop(context);

                                }
                                _state.text=" ";
                                _city.text=" ";
                                _phone.text=" ";
                                _pincode.text=" ";
                                _name.text=" ";
                                _house.text=" ";
                                _district.text=" ";
                                _landmark.text=" ";



                              },
                            ),
                          )),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}