import 'package:flutter/material.dart';
import '../blocs/login_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
          child: StreamBuilder<String>(
              stream: loginBloc.email,
              builder: (context, snapshot) {
                return Text(snapshot.data.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
                );
              }),
        ),
      ),
    );
  }
}
