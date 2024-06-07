import 'package:flutter/material.dart';
import 'package:shoppingapp/app/firstpage.dart';
import 'package:shoppingapp/app/trial.dart';

import 'app/start.dart';
import 'database.dart';


final userLogic = UserLogic();

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await userLogic.createDatabaseAndTable();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: start(),
      )
  );
}