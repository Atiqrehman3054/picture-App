import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:picture_app/Cat_app/Screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:picture_app/UI%20Firebase/Screens/Login%20Screen.dart';
import 'package:picture_app/UI%20Firebase/Screens/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:picture_app/camera.dart';
import 'package:picture_app/screens/app.dart';
import '';
// import 'package:picture_app/screens/Login_app/Login_bloc.dart';
// import 'package:picture_app/screens/Login_app/log.dart';
// import 'package:picture_app/screens/Selected.dart';
// import 'package:picture_app/screens/app.dart';
// import 'package:picture_app/screens/SelectedList.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "animation app",
      home: Pic(),
    );
  }
}

//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//        future: Firebase.initializeApp(),
//
//         builder: (context, shot){
//          if(shot.connectionState == ConnectionState.done){
//            return MaterialApp(
//              debugShowCheckedModeBanner: false,
//              title: 'flutter app',
//
//              home:
//              (FirebaseAuth.instance.currentUser == null)? LoginScreen() : HomeScreen(),
//            );
//          }
//          else{
//            return MaterialApp(
//              home: Scaffold(
//                 body: Container(
//                   color: Colors.white54,
//                 ),
//              ),
//            );
//
//          }
//
//         }
//     );
//   }
// }

