import 'package:flutter/material.dart';
import 'package:shoppingapp/app/start.dart';

import 'cart.dart';
import 'extras.dart';
import 'firstpage.dart';

class checkout extends StatefulWidget{
  @override
  _checkoutState createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: menu(event1: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (c){
              return first_page(username: '',);
            })
        );
      },
        event3: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (c){
                return cart(username: '',);
              })
          );
        },
        event4: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (c){
                return start();
              })
          );
        },),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Color.fromARGB(255, 255, 250, 247),
        child: Padding(
          padding: const EdgeInsets.only(top: 25,right: 10),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          icnButton(
                            event: (){
                              setState(() {
                                _scaffoldKey.currentState!.openDrawer();
                              });
                            },
                            pic: Icon(Icons.menu,color: Color.fromARGB(255, 216, 147, 99)),
                            bcolor: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Check Out', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,fontFamily: 'round',color: Color.fromARGB(255, 218, 137, 81)),),
                ],
              ),
              SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('Total Cost: ', style: TextStyle(fontFamily: 'round',fontSize: 25),),
                        Text('\$50', style: TextStyle(fontFamily: 'round',fontSize: 25,color: Color.fromARGB(255, 218, 137, 81)),),
                      ],
                    ),
                  ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text('Address: ', style: TextStyle(fontFamily: 'round',fontSize: 25),),
                    Text('\$50', style: TextStyle(fontFamily: 'round',fontSize: 25,color: Color.fromARGB(255, 218, 137, 81)),),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}