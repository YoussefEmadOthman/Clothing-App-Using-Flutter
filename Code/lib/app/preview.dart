import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/app/start.dart';

import '../run.dart';
import 'cart.dart';
import 'extras.dart';
import 'favorites.dart';
import 'firstpage.dart';

class preview extends StatefulWidget {
  final Map<String, dynamic> product;

  preview({required this.product});

  @override
  _previewState createState() => _previewState();
}

class _previewState extends State<preview> {
  late Map<String, dynamic> product;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    userLogic.createDatabaseAndTable();
    product = widget.product;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: menu(
        event1: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (c) {
              return first_page(username: '',);
            }),
          );
        },

        event3: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (c) {
              return cart(username: 'widget.username');
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
        width: double.maxFinite,
        height: double.maxFinite,
        color: Color.fromARGB(255, 255, 250, 247),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      )
                    ],
                  ),
                  Column(
                    children: [
                      icnButton(
                        event: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return cart(username: 'widget.username');
                            }),
                          );
                        },
                        pic: Icon(Icons.shopping_bag_outlined, color: Color.fromARGB(255, 216, 147, 99)),
                        bcolor: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/${product['Images']}"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${product['Name']}', style: TextStyle(fontSize: 30, fontFamily: 'round', fontWeight: FontWeight.bold)),
                          Text('\$${product['Price']}', style: TextStyle(fontSize: 20, fontFamily: 'round', fontWeight: FontWeight.bold, color: Color.fromARGB(255, 224, 142, 96))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.star_fill, color: Colors.amber),
                    Icon(CupertinoIcons.star_fill, color: Colors.amber),
                    Icon(CupertinoIcons.star_fill, color: Colors.amber),
                    Icon(CupertinoIcons.star_fill, color: Colors.amber),
                    Icon(CupertinoIcons.star_lefthalf_fill, color: Colors.amber),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  '${product['Description']}',
                  style: TextStyle(fontSize: 20, fontFamily: 'round', color: Color.fromARGB(255, 159, 159, 159)),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  // Add your logic for adding to cart
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
                        offset: Offset(0, 3),
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
                              'Add To Cart',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontFamily: 'round',
                                fontSize: 25,
                              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
