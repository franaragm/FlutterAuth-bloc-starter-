import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          spacing(15.0),
          submitButton()
        ],
      ),
    );
  }

  Widget spacing(double value) {
    return Container(
      margin: EdgeInsets.all(value),
    );
  }
  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: 'you@example.com',
              labelText: 'email address'
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: 'Enter your password',
              labelText: 'password'
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.blue,
      onPressed: () => print('ay')
    );
  }

}