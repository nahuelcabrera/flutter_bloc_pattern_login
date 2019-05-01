import 'dart:async';

class LoginValidator {

  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@') && email.split('@').length == 2){
        sink.add(email);
      }else{
        sink.addError('Email no válido');
      }
    }
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 8){
        sink.add(password);
      }else{
        sink.addError('Debe tener al menos 8 carácteres');
      }
    }
  );

}