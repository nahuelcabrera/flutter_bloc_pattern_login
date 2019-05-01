import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../blocs/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.amberAccent,
                  child: Center(
                    child: Text('Bienvenido\n'
                        'Descubre un mundo de BLoC´s',
                        style: Theme.of(context).textTheme.title,
                        ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Center(child: inputEmail())),
              Expanded(flex: 1, child: Center(child: inputPassword())),
              Center(child: submitButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputEmail() => StreamBuilder(
    stream: loginBloc.email,
    builder: (context, snapshot){
      return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          errorText: snapshot.error
        ),
        onChanged: loginBloc.changeEmail,
      );
    },
  );

  Widget inputPassword() => StreamBuilder(
    stream: loginBloc.password,
    builder: (context, snapshot){
      return TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          errorText: snapshot.error
        ),
        onChanged: loginBloc.changePassword,
      );
    },
  );

  Widget submitButton() => StreamBuilder(
    stream: loginBloc.submitValue,
    builder: (context, snapshot){
      return RaisedButton(
        elevation: 0.0,
        highlightElevation: 0.0,
        color: Colors.amber,
        child: Text(
          'Ingresar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        shape: StadiumBorder(),
        onPressed: snapshot.hasData ? (){
          loginBloc.submit(context);
        } : null,
      );
    },
  );
}
