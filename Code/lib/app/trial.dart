import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../database.dart';
import '../dbstate.dart';


class DataApp extends StatelessWidget {
  @override
  Widget text(
      {
        required String name,Color color=Colors.black,double fSize=20

      }
      )
  =>Text
    (
    name,style: TextStyle(fontSize: fSize,color: color,fontWeight: FontWeight.bold),
  );
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>UserLogic()..createDatabaseAndTable(),
        child: BlocConsumer<UserLogic,UserState>(
          listener:(context,state){} ,
          builder:(context,state){
            UserLogic obj=BlocProvider.of(context);

            return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () async {

                        await obj.insertProduct('Beige Pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '40', 'Man','Trousers', 'mpants1.png');
                        await obj.insertProduct('Dark Green pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '40', 'Man','Trousers', 'mpants2.png');
                        await obj.insertProduct('Blue Pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '40', 'Man','Trousers', 'mpants3.png');
                        await obj.insertProduct('Sky Blue Pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '40', 'Man','Trousers', 'mpants4.png');
                        await obj.insertProduct('Black Shorts', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '30', 'Man','Shorts', 'mshorts1.png');
                        await obj.insertProduct('White Shorts', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '30', 'Man','Shorts', 'mshorts2.png');
                        await obj.insertProduct('White T-shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '35', 'Man','Shorts', 'mtshirt1.png');
                        await obj.insertProduct('Brown T-shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '35', 'Man','T-shirts', 'mtshirt2.png');
                        await obj.insertProduct('Blue T-shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '35', 'Man','T-shirts', 'mtshirt3.png');
                        await obj.insertProduct('Green T-shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '35', 'Man','T-shirts', 'mtshirt4.png');
                        await obj.insertProduct('Ivory Shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '45', 'Man','Shirts', 'shirt1.png');
                        await obj.insertProduct('Stripes Shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '45', 'Man','Shirts', 'shirt2.png');
                        await obj.insertProduct('Black Shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '45', 'Man','Shirts', 'shirt3.png');
                        await obj.insertProduct('Baby Pink Shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '45', 'Man','Shirts', 'shirt4.png');
                        await obj.insertProduct('Pink T-shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '30', 'Woman','T-shirts', 'gtshirt2.png');
                        await obj.insertProduct('White T-shirt', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '50', 'Woman','T-shirts', 'gtshirt3.png');
                        await obj.insertProduct('Blue Dress', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '50', 'Woman','Dresses', 'dress3.png');
                        await obj.insertProduct('Brown Dress', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '60', 'Woman','Dresses', 'dress4.png');
                        await obj.insertProduct('Black Pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '45', 'Woman','Trousers', 'gpants1.png');
                        await obj.insertProduct('Beige Pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '40', 'Woman','Trousers', 'gpants2.png');
                        await obj.insertProduct('Grey Pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '50', 'Woman','Trousers', 'gpants3.png');
                        await obj.insertProduct('Grey Pants', 'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed do eiusmod tempor', '55', 'Woman','Trousers', 'gpants4.png');







                        // await obj.db.rawDelete('DELETE FROM Products WHERE Category = ?',['Man']);
                      },
                      child: Container(
                        color: Color.fromARGB(255, 18, 38, 67),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Okay",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Container(
                        width:double.infinity,
                        child: (obj.products.length<=0)?
                        Center(child: CircularProgressIndicator()):
                        Column(
                          children: [
                            for(int i=0;i<obj.products.length;i++)
                              Card(
                                  color:Colors.amber,
                                  child: ListTile(
                                      title: text(name:obj.products[i]['Category'],color: Colors.black)
                                  )

                              ),

                          ],
                        )
                    ),

                  ],

                ),
              ),



            );



          } ,


        )
    );
  }
}