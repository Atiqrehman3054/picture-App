import 'package:flutter/material.dart';
import 'package:picture_app/maxiain/validate_mixain.dart';
import 'dart:async';

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with Validation {

  final formKey = GlobalKey<FormState>();
  String email =  '';
  String password = '';



  @override

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.3),
        child: Form(
          key: formKey,
          child: Column(
            children: [

              emailField(),
              passwordField(),
              Container(
                margin: EdgeInsets.only(bottom: 25),
              ),
          ElevatedButton(onPressed: (){


         if(formKey.currentState.validate()){
           formKey.currentState.save();
           print('print my date Mean $email and $password send to some api');
         }


          }, child: Text('Submit')
          ),
            ],
          ),
        ),
      )
    ));
  }

  Widget passwordField(){
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(

            labelText: 'Password',
            hintText: '*******'


        ),

        onSaved: (String value){
          password = value;

        },
        validator: validatePassword
    );

  }

  Widget emailField(){

    return TextFormField(

      keyboardType:  TextInputType.emailAddress,
      decoration: InputDecoration(

        labelText: 'Email',
        hintText: 'a***@gmail.com',

      ),
      validator:validateEmail,

      onSaved: (String value){

        email  = value;
      },
    );

  }
}


