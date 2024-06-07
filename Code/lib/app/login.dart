import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shoppingapp/app/signup.dart';

import '../run.dart';
import 'extras.dart';
import 'firstpage.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  int loggedInUserId = 0;

  @override
  void initState() {
    super.initState();
    userLogic.createDatabaseAndTable();
  }


  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.only(top: 35),
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
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Log In',
                              style:
                              TextStyle(color: Colors.white, fontSize: 40,fontFamily: 'round'),
                            ),
                            SizedBox(height: 20,),
                            form(control: username, name: 'Username'),
                            form(control: password, name: 'Password'),
                            SizedBox(height: 30,),
                            txtButton(
                              event: () async {
                                // Fetch the latest user data from the database
                                await userLogic.showData(userLogic.db).then((value) {
                                  userLogic.users = value;
                                });


                                bool accessGranted = false;

                                for (int i = 0; i < userLogic.users.length; i++) {
                                  if (userLogic.users[i]['Username'] == username.text &&
                                      userLogic.users[i]['Password'] == password.text) {
                                    loggedInUserId = userLogic.users[i]['UserID'];
                                    accessGranted = true;
                                    break; // Exit the loop after finding a match
                                  }
                                }

                                if (accessGranted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => first_page(username: username.text)),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Warning'),
                                        content: Text('You do not have access'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Close the dialog
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              bcolor: Color.fromARGB(255, 216, 147, 99),
                              tcolor: Colors.white,
                              name: 'Log In',
                              elevation: 2,
                            ),
                            txtButton(
                              event: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (c) {
                                    return signup();
                                  }),
                                );
                              },
                              bcolor: Colors.transparent,
                              tcolor: Colors.white,
                              name: 'Not a member? Sign Up',
                              elevation: 0,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
