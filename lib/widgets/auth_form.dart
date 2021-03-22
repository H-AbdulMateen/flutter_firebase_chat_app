import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  var _isLogin = true;
  var _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value){
                      if(value.isEmpty && !value.contains('@')){
                        return 'Enter valide email!';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address'
                    ),
                  ),
                  Visibility(
                    visible: !_isLogin,
                    child: TextFormField(
                      controller: _usernameController,
                      validator: (value){
                        if(value.isEmpty && value.length < 4){
                          return 'username must be at least 5 characters!';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Username'
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value){
                      if(value.isEmpty && value.length < 4){
                        return 'password must be at least 5 characters!';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 12.0,),
                  RaisedButton(onPressed: _trySubmit,
                  child: Text(_isLogin ? 'Login': 'SignUp'),),
                  FlatButton(onPressed: (){
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin ? 'Create a new account' : 'Already have an account'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  void _trySubmit() {
    if(_formKey.currentState.validate()){
      print('${_emailController.text}, ${_usernameController.text}, ${_passwordController.text}');
    }
  }
}
