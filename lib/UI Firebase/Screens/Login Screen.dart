import 'package:flutter/material.dart';

import 'package:picture_app/UI%20Firebase/Screens/home_screen.dart';
import 'package:picture_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatelessWidget {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  get textEntered => null;

  Future<void> createNewUserData(){
    _firestore.collection('user').doc(_auth.currentUser.uid).set({


      'name':'user',
      'uid': _auth.currentUser.uid,
      'bio': 'Design + Code atiq',
      'complete': [],
      'recents': [],
      'badges': [],
      'certificates':[],
      'profilePic': '',


    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [

                Container(
                  transform: Matrix4.translationValues(0, -75, 0),
                  child: Image.asset(
                    'asset/illustrations/illustration-14.png',
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0, -170, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Learn to design \n and code app",
                        style: kLargeTitleStyle.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        "Complete course about the best \n tools and desgin system",
                        style:
                            kHeadlineLabelStyle.copyWith(color: Colors.white70),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              transform: Matrix4.translationValues(0, -150, 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 53.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Log in to',
                      style: kTitle1Style,
                    ),
                    Text(
                      'Start learning',
                      style: kTitle1Style.apply(color: Color(0xFF5B4CF0)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 130.0,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 16.0,
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 5.0),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: kPrimaryLabelColor,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.email,
                                        color: Color(0xFF5488F1),
                                        size: 20.0,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Email Adress',
                                      hintStyle: kLoginInputTextStyle,
                                    ),
                                    style: kLoginInputTextStyle.copyWith(
                                        color: Colors.black),
                                    onChanged: (textEntered) {
                                      email = textEntered;
                                      print(email);
                                    },
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, bottom: 5.0),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: kPrimaryLabelColor,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.lock,
                                        color: Color(0xFF5488F1),
                                        size: 20.0,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: kLoginInputTextStyle,
                                    ),
                                    style: kLoginInputTextStyle.copyWith(
                                        color: Colors.black),
                                    onChanged: (textEntered) {
                                      password = textEntered;
                                      print(password);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            try {
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } on FirebaseAuthException catch (err) {
                              if (err.code == "user-not-found") {
                                try {
                                  await _auth.
                                  createUserWithEmailAndPassword(email: email, password: password)
                                      .then((user)  {
                                        user.user.sendEmailVerification();
                                        createNewUserData();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreen(),
                                        fullscreenDialog: false,
                                      ),
                                    );
                                  });
                                } catch (err) {}
                              } else {
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('error'),
                                        content: Text(err.message),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok!'),
                                          )
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: Container(

                            child: Text(
                              'Login',
                              style: kCalloutLabelStyle.copyWith(
                                  color: Colors.white),
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(colors: [
                                  Color(0xFF73A0F4),
                                  Color(0xFF4A47F5),
                                ])),
                            height: 47.0,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        _auth.sendPasswordResetEmail(email: email)
                            .then((value) =>
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text('EmailConformation'),
                                content: Text('Please check your email and verfied password'),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();

                                  }, child: Text('OK!'))
                                ],

                              );
                            }));
                      },
                      child: Text(
                        'Forget password?',
                        style:
                            kCalloutLabelStyle.copyWith(color: Color(0x721B1E9C)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
