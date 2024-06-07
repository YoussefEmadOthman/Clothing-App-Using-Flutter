import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'dbstate.dart';

class UserLogic extends Cubit<UserState> {
  late Database db;
  List users = [];
  List products = [];
  UserLogic() : super(InitUser());


  createDatabaseAndTable() async {
    db = await openDatabase(
      'u.db',
      version: 2,
      onCreate: (d, v) {
        print('Database Created');
        d.execute('CREATE TABLE Users ('
            'UserID INTEGER PRIMARY KEY, '
            'Username TEXT NOT NULL, '
            'Email TEXT NOT NULL, '
            'Password TEXT NOT NULL, '
            'Address TEXT NOT NULL, '
            'Phone_number Text NOT NULL, '
            'Card_Number TEXT UNIQUE)');
        print('User Table Created');
        d.execute(
            'CREATE TABLE Products (ProductID INTEGER PRIMARY KEY, Name TEXT,Description Text,Price Text, Category Text, Type Text,Images text)');

        print('Product Table Created');
        d.execute(
            'CREATE TABLE Cart (CartID INTEGER PRIMARY KEY, UserID INTEGER, ProductName TEXT, ProductID INTEGER, Quantity INTEGER, FOREIGN KEY (UserID) REFERENCES Users (UserID), FOREIGN KEY (ProductID) REFERENCES Products (ProductID))');
        print('Cart Table Created');
        d.execute(
            'CREATE TABLE WishList (WishListID INTEGER PRIMARY KEY, UserID INTEGER, ProductName TEXT, ProductID INTEGER, FOREIGN KEY (UserID) REFERENCES Users (UserID), FOREIGN KEY (ProductID) REFERENCES Products (ProductID))');
        print('WishList Table Created');
      },

      onOpen: (d) async {
        await d.execute('PRAGMA foreign_keys = ON;');
        showData(d).then((value) {
          users = value;
          emit(CreateUser());
        });
        showproducts(d).then((value) {
          products = value;
        });
      },
    );
  }

  bool insertuser(String Username, String Email, String Password, String Address, String Phone_number) {
    if (Username.isEmpty ||
        Email.isEmpty ||
        Password.isEmpty ||
        Address.isEmpty ||
        Phone_number.isEmpty) {
      print('Fields cannot be empty');
      return false;
    }

    db.transaction((txn) async {
      txn.rawInsert(
          'insert into Users(Username,Email,Password,Address,Phone_number)'
              'values("$Username","$Email","$Password","$Address","$Phone_number")')
          .then((value) {
        print('Row Inserted $value');
        emit(InsertUser());
      });
    });
    return true;
  }

  Future<List<Map<String, Object?>>> showData(Database c) async
  {
    return await c.rawQuery('select * from Users');
  }
  bool insertProduct(String name, String description, String price, String category, String type, String images) {
    if (name.isEmpty || description.isEmpty || price.isEmpty || category.isEmpty|| type.isEmpty || images.isEmpty) {
      print('Fields cannot be empty');
      return false;
    }

    db.transaction((txn) async {
      txn.rawInsert(
          'insert into Products(Name, Description, Price, Category, Type ,Images) '
              'values("$name", "$description", "$price", "$category","$type" ,"$images")')
          .then((value) {
        print('Product Inserted: $value');

      });
    });
    return true;
  }

  Future<List<Map<String, Object?>>> showproducts(Database c) async
  {
    return await c.rawQuery('select * from Products');
  }


}