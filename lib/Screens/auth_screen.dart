import 'package:flutter/material.dart';
import 'package:nekidaem_kanban/BLoC/auth_bloc.dart';
import 'package:nekidaem_kanban/BLoC/login_bloc.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _authBloc;
  var loginBloc;
  final _tokenFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  Map<String, String> _authData = {
    'username': '',
    'pasword': '',
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _authBloc = Provider.of<AuthBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Kanban'),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<LoginBloc>(
                  builder: (context, _loginBloc, _) {
                    return StreamBuilder(
                        stream: _loginBloc.email,
                        builder: (context, snapshot) {
                          return TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Enter your username',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              errorText: snapshot.error,
                            ),
                            textInputAction: TextInputAction.next,
                            onSaved: (value) {
                              _authData['username'] = value;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_tokenFocusNode);
                            },
                            onChanged: (String value) {
                              _loginBloc.updateEmail(value);
                            },
                          );
                        });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<LoginBloc>(
                  builder: (context, _loginBloc, _) {
                    return StreamBuilder(
                        stream: _loginBloc.password,
                        builder: (context, snapshot) {
                          return TextFormField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                gapPadding: 30,
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              errorText: snapshot.error,
                            ),
                            textInputAction: TextInputAction.next,
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                            focusNode: _tokenFocusNode,
                            onChanged: (String value) {
                              _loginBloc.updatePassword(value);
                            },
                          );
                        });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: FlatButton(
                  height: 50,
                  color: Colors.cyanAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("Log in"),
                  onPressed: () {
                    _authBloc.login(
                        _authData['username'], _authData['password']);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
