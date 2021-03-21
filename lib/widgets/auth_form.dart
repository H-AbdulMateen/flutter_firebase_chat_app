import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email Address'
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username'
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 12.0,),
                  RaisedButton(onPressed: (){},
                  child: Text('Login'),),
                  FlatButton(onPressed: (){},
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Create a new account'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
