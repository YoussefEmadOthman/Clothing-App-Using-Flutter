import 'package:flutter/material.dart';

import 'extras.dart';
import 'login.dart';

class start extends StatefulWidget{
  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/start.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.only(top: 390),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Best',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70,color: Colors.white,fontFamily: 'round'),),
                    Text('\t\tOutfits',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70,color: Colors.white,fontFamily: 'round'),),
                    Text('\t \t \t \t \t \t \tFor you',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 50,color: Colors.white,fontFamily: 'round'),),
                  ],
                ),
              ),

            SizedBox(height: 10,),
            Column(
              children: [
                txtButton(
                    event: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (c){
                            return login();
                          })
                      );
                    },
                    bcolor: Colors.white,
                    tcolor: Color.fromARGB(255, 215, 146, 97),
                    name: 'Get Started',
                    elevation: 2)
              ],
            )
          ],
        ),
      ),
    );
  }
}