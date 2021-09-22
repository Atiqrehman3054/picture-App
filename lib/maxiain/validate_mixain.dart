import 'package:flutter/material.dart';
import 'package:picture_app/Bloc_system/Bloc.dart';
import 'dart:async';
class Validation {

  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please Enter a Valid Email Address';
    }

    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'please enter greater then for';
    }
    return null;
  }
  final ValidatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length > 3){
        sink.add(password);
      }else {
          sink.addError('Password must be at  least  4 charcheter');
      }
    }
  );
  final ValidateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email == '@'){
        sink.add(email);
      }else {
          sink.addError('Please enter a vaild email');
      }
    }
  );
}
