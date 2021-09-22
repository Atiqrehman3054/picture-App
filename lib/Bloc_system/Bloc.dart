import 'dart:async';

import 'package:picture_app/maxiain/validate_mixain.dart';


class Bloc extends Object with Validation{
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  //add stream
  Stream<String> get email => _email.stream.transform(ValidateEmail);
  Stream<String> get password => _password.stream.transform(ValidatePassword);


  //add sink
  Function(String ) get changeEmail => _email.sink.add;
  Function(String ) get changePassword => _email.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();