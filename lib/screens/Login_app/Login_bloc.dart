import 'package:flutter/material.dart';
import 'package:picture_app/Bloc_system/Bloc.dart';
import 'package:picture_app/maxiain/validate_mixain.dart';

final bloc = Bloc();


class LoginBlog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                emailField(),
                passwordField(),
                SizedBox(
                  height: 20,
                ),
                button(),

              ],
            ),
          ),
    ));
  }

  Widget emailField(){
    return  TextField(

      decoration: InputDecoration(
        hintText: 'exmple@gmail.com',
        labelText: 'Email',


      ),
    );

  }

  Widget passwordField(){
    return TextField(
      decoration: InputDecoration(
        hintText: '*********',
        labelText: 'password',

      ),

    );

  }

  Widget button(){

    return  OutlinedButton(
      onPressed: (){},
      child: Text('Submit'),
      style: ButtonStyle(

      ),
    );
  }


}
