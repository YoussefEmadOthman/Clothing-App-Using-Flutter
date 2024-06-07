import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget form({required TextEditingController control,String name =''}){
  return Container(
    width: 300,
    child: TextFormField(
      controller: control,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Enter $name",
        labelStyle: TextStyle(color: Colors.white,),
        fillColor: Colors.white,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 128, 83, 61),
            width: 2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}

Widget txtButton({required Function() event, required Color bcolor, required tcolor,String name='', double elevation =0, double size = 23}){
  return ElevatedButton(
    onPressed: event,
    child: Text('$name',
      style: TextStyle(fontWeight: FontWeight.w500,
          color: tcolor, fontSize: size,fontFamily: 'round'),
    ),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40), // Adjust the value for desired rounding
      ),
      minimumSize: Size(250, 63), // Change width and height
      primary: bcolor,
      elevation: elevation,
    ),
  );
}

Widget icnButton({required Function() event, required Icon pic, required Color bcolor, required double size}){
  return IconButton(
    onPressed: event,
    icon: pic,
    color: bcolor,
    iconSize: size,
    splashColor: Colors.grey,
    // Change this value to adjust the icon size
  );
}

Widget clrButton({required Function() event, required String name, required Color tcolor, required Color bcolor, required Color borColor}){
  return Padding(
    padding: const EdgeInsets.only(right: 4),
    child: ElevatedButton(
      onPressed: event,
      child: Text('$name',style: TextStyle(fontSize: 15,color: tcolor,fontFamily: 'round',fontWeight: FontWeight.w400),),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: borColor,width: 2)
        ),
        minimumSize: Size(120, 35), // Change width and height
        primary: bcolor,
        elevation: 0,
      ),
    ),
  );
}

Widget menu({required Function() event1,required Function() event3,required Function() event4,})
=>Drawer(
  child: Container(
      color: Color.fromARGB(255, 255, 250, 247),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text( ''), accountEmail: Text('Welcome To our app!',style: TextStyle(fontSize: 20,fontFamily: 'round')),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 215, 159, 122),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: event1,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(255, 255, 250, 247),
              child: ListTile(
                leading: Icon(Icons.attach_money_outlined,color: Color.fromARGB(255, 40, 54, 24),size: 30,),
                title: Text('Products',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 218, 137, 81),fontFamily: 'round')),
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: event3,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(255, 255, 250, 247),
              child: ListTile(
                leading: Icon(CupertinoIcons.cart,color: Color.fromARGB(255, 40, 54, 24),size: 30),
                title: Text('Cart',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 218, 137, 81),fontFamily: 'round')),
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: event4,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(255, 255, 250, 247),
              child: ListTile(
                leading: Icon(Icons.exit_to_app,color: Color.fromARGB(255, 40, 54, 24),size: 30),
                title: Text('Sign Out',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 218, 137, 81),fontFamily: 'round')),
              ),
            ),
          ),
        ],
      ),
    ),
);