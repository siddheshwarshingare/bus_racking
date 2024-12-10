import 'package:account_management_application/admin_dashbord.dart';
import 'package:account_management_application/search_screen.dart';
import 'package:account_management_application/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: 
     // const
       LoginScreen(),
     
    );
  }
}