import 'dart:ui';
import 'package:flutter/material.dart';
import '../run.dart';
import 'extras.dart';
import 'login.dart';

class signup extends StatefulWidget{
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController number = TextEditingController();

  @override

  void initState()
  {
    super.initState();
    userLogic.createDatabaseAndTable();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/start.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.transparent,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
                      child: Container(
                        color: Colors.transparent, // Add opacity
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 40,fontFamily: 'round'),),
                              SizedBox(height: 20,),
                              form(control: email,name: 'Email Address'),
                              SizedBox(height: 20,),
                              form(control: username,name: 'Username'),
                              SizedBox(height: 20,),
                              form(control: password,name: 'Password'),
                              SizedBox(height: 20,),
                              form(control: number,name: 'Phone number'),
                              SizedBox(height: 20,),
                              form(control: address,name: 'Address'),
                              SizedBox(height: 30,),
                              txtButton(
                                event: () async {
                                  bool insertionSuccessful = await userLogic.insertuser(username.text, email.text, password.text, address.text,number.text);
                                  if (insertionSuccessful==true) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Success'),
                                          content: Text('Welcome to our E&S FAMILY!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                  else
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Failed'),
                                          content: Text('Fields cannot be empty please fill in all the fields'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                  }

                                },
                                name: 'Sign Up',
                                bcolor: Color.fromARGB(255, 216, 147, 99),
                                tcolor: Colors.white,
                                elevation: 2,
                              ),

                              txtButton(
                                  event: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (c){
                                          return login();
                                        })
                                    );
                                  },
                                  bcolor: Colors.transparent,
                                  tcolor: Colors.white,
                                  name: 'Already a member? Log In',
                                  elevation: 0,
                                  size: 20
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
