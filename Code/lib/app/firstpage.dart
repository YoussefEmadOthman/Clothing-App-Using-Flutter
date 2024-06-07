import 'package:flutter/material.dart';
import 'package:shoppingapp/app/preview.dart';
import 'package:shoppingapp/app/start.dart';
import '../run.dart';
import 'cart.dart';
import 'extras.dart';

class first_page extends StatefulWidget {
  final String username;
  first_page({required this.username});

  @override
  _first_pageState createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  List<String> type = ['Man', 'Woman'];
  List<String> filter = ['', 'T-shirts', 'Shirts', 'Shorts', 'Trousers', 'Dresses'];
  late List<bool> typePressedState = List.generate(filter.length, (index) => false);
  late String dropdownvalue = filter.first;
  bool isDrawerOpen = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedType = '';
  String clothType='';


  @override


  Map<String, dynamic> getProductData(int productId) {
    for (var product in userLogic.products) {
      if (product['ProductID'] == productId) {
        return product;
      }
    }
    return {}; // Return an empty map if no product with the given ID is found
  }

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
              return cart(username: '${widget.username}',);
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
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                                return cart(username: '${widget.username}',);
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
                Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            'Welcome ${widget.username},',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, fontFamily: 'round', color: Color.fromARGB(255, 218, 137, 81)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '\t\t\t\tto our fashion world!',
                            style: TextStyle(fontFamily: 'round', fontSize: 20, color: Color.fromARGB(255, 57, 55, 54)),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < type.length; i++)
                            clrButton(
                              event: () {
                                typePressedState[i] = !typePressedState[i];
                                if (typePressedState[i]==false) {
                                  selectedType = '';
                                } else {
                                  selectedType = type[i];
                                }
                                setState(() {});
                              },
                              name: '${type[i]}',
                              tcolor: typePressedState[i] ? Colors.white : Colors.black,
                              bcolor: typePressedState[i] ? Color.fromARGB(255, 219, 143, 91) : Color.fromARGB(255, 255, 250, 247),
                              borColor: typePressedState[i] ? Colors.transparent : Color.fromARGB(255, 219, 143, 91),
                            ),
                          Container(
                            width: 120,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: Color.fromARGB(255, 219, 143, 91), width: 2),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: dropdownvalue,
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownvalue = value!;
                                    clothType = dropdownvalue;
                                  });
                                },
                                items: filter.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                                underline: Container(
                                  height: 0,
                                ),
                                dropdownColor: Color.fromARGB(255, 255, 250, 247),
                                icon: Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 219, 143, 91)),
                                elevation: 0,
                                isDense: true,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      for (int productId = 1; productId <= userLogic.products.length; productId += 2)
                        if ((selectedType.isEmpty || getProductData(productId)['Category'] == selectedType) &&
                            (clothType.isEmpty || getProductData(productId)['Type'] == clothType))
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (c) {
                                        return preview(product: getProductData(productId));
                                      }),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/${getProductData(productId)['Images']}"),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5, top: 5,bottom: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${getProductData(productId)['Name']}',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'lora',
                                              ),
                                            ),
                                            Text(
                                              '\$${getProductData(productId)['Price']}',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'lora',
                                                color: Color.fromARGB(255, 224, 142, 96),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    if (productId + 1 <= userLogic.products.length) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (c) {
                                          return preview(product: getProductData(productId + 1));
                                        }),
                                      );
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (productId + 1 <= userLogic.products.length)
                                        Container(
                                          height: 180,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/${getProductData(productId + 1)['Images']}"),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                      if (productId + 1 <= userLogic.products.length)
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5, top: 5,bottom: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${getProductData(productId + 1)['Name']}',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'lora',
                                                ),
                                              ),
                                              Text(
                                                '\$${getProductData(productId + 1)['Price']}',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'lora',
                                                  color: Color.fromARGB(255, 224, 142, 96),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}