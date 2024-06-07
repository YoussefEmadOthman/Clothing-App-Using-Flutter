import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/app/start.dart';
import 'extras.dart';
import 'favorites.dart';
import 'firstpage.dart';

class cart extends StatefulWidget {
  final String username;

  cart({required this.username});
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: menu(
        event1: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (c) {
              return first_page(username: '');
            }),
          );
        },

        event3: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (c) {
              return cart(username: widget.username);
            }),
          );
        },
        event4: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (c) {
              return start();
            }),
          );
        },
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Color.fromARGB(255, 255, 250, 247),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 10),
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icnButton(
                          event: () {
                            setState(() {
                              _scaffoldKey.currentState!.openDrawer();
                            });
                          },
                          pic: Icon(Icons.menu, color: Color.fromARGB(255, 216, 147, 99)),
                          bcolor: Colors.white,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 218, 137, 81),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Username: ${widget.username}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'round'
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Shopping Cart',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, fontFamily: 'round', color: Color.fromARGB(255, 218, 137, 81)),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 215, 159, 122),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Product', style: TextStyle(color: Color.fromARGB(255, 255, 250, 247), fontFamily: 'round', fontSize: 20)),
                            Text('Details', style: TextStyle(color: Color.fromARGB(255, 255, 250, 247), fontFamily: 'round', fontSize: 20)),
                            Text('Remove', style: TextStyle(color: Color.fromARGB(255, 255, 250, 247), fontFamily: 'round', fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/dress3.png'), // Replace with your image asset
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Text('Blue Dress', style: TextStyle(fontFamily: 'round', fontSize: 20)),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text('Price: ', style: TextStyle(fontFamily: 'round', fontSize: 20)),
                                      Text('\$50', style: TextStyle(fontFamily: 'round', fontSize: 20, color: Color.fromARGB(255, 218, 137, 81))),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(CupertinoIcons.trash, color: Color.fromARGB(255, 218, 137, 81), size: 30),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/gtshirt2.png'), // Replace with your image asset
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Text('Pink T-Shirt ', style: TextStyle(fontFamily: 'round', fontSize: 20)),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text('Price: ', style: TextStyle(fontFamily: 'round', fontSize: 20)),
                                      Text('\$30', style: TextStyle(fontFamily: 'round', fontSize: 20, color: Color.fromARGB(255, 218, 137, 81))),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(CupertinoIcons.trash, color: Color.fromARGB(255, 218, 137, 81), size: 30),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 3,
                        width: double.maxFinite,
                        color: Color.fromARGB(255, 218, 137, 81),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            'Total Cost: ',
                            style: TextStyle(fontFamily: 'round', fontSize: 25),
                          ),
                          Text(
                            '\$80',
                            style: TextStyle(fontFamily: 'round', fontSize: 25, color: Color.fromARGB(255, 218, 137, 81)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () {
                          // Add your checkout logic here
                        },
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 215, 139, 89),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // vertical and horizontal shadow offset
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\t\t\tGo To Checkout',
                                      style: TextStyle(color: Colors.white, fontFamily: 'round', fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
