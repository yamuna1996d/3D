import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';

class PasswordChange extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  TextEditingController _newpass = TextEditingController();

  TextEditingController _confirmpass = TextEditingController();

  TextEditingController _oldpass = TextEditingController();

  final GlobalKey _formGlobalKey=GlobalKey();

  FocusNode _oldpassFocusnode, _newpassFocusnode, _confirmpassFocusnode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _oldpassFocusnode = FocusNode();
    _newpassFocusnode = FocusNode();
    _confirmpassFocusnode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _oldpassFocusnode = FocusNode();
    _newpassFocusnode = FocusNode();
    _confirmpassFocusnode = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: PrimaryColor,), onPressed: (){
          Navigator.pop(context);
        }),
        title: Text("Change Password",style: TextStyle(
          fontSize: 19,
          color: Colors.black

        ),),
        elevation: 0.2,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formGlobalKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                controller: _oldpass,
               focusNode:_oldpassFocusnode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_oldpassFocusnode);
                },
                decoration: InputDecoration(


                  hintText: "Enter your old password",

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
                    return 'Enter Your old password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _newpass,
                focusNode:_newpassFocusnode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_newpassFocusnode);
                },
                decoration: InputDecoration(


                  hintText: "Enter a New Password",

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
                    return 'Enter a new password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _newpass,
                focusNode:_confirmpassFocusnode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_confirmpassFocusnode);
                },
                decoration: InputDecoration(


                  hintText: "Confirm your new password",

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
                    return 'Confirm your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              SizedBox(height: 20),
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
                          child: Text("Save Changes",
                              style: const TextStyle(
                                  color: const Color(0xfffefefe),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0)),
                        ),
                      ),
                      onTap: (){
                        final FormState form = _formGlobalKey.currentState;
                        if(form.validate()){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressForm()));
                        }

                      },
                    ),
                  ))

            ],
          ),
        ),
      ),
    );
  }
}
