import 'dart:async';
import 'package:login_bloc/screens/home_screen.dart';

import 'login_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LoginBloc with LoginValidator {

  /* WITH NATIVE DART STREAMCONTROLLER
   * final _email = new StreamController<String>.broadcast();
   * final _password = new StreamController<String>.broadcast();
   */

  
  //WITH REACTIVE X

  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();

  //ADD DATA TO STREAM
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //RETRIEVE DATA FROM STREAM
  Stream<String> get email => _email.stream.transform(emailValidator);
  
  Stream<String> get password => _password.stream.transform(passwordValidator);
  
  Stream<bool> get submitValue => Observable
  .combineLatest2(email, password, (e, p) => true);

  dispose(){
    _email.close();
    _password.close();
  }

  submit(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
  }

}


final loginBloc = new LoginBloc();