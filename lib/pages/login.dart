import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'localization/localizations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form with validation
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onSaved: (value) => _email = value.trim(),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context)
                              .translate('enter email');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .translate('email address'))),
                  TextFormField(
                      onSaved: (value) => _password = value.trim(),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context)
                              .translate('enter password');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .translate('password'))),
                  SizedBox(height: 40.0),
                  ButtonTheme(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15),
                      color: Colors.blue,
                      child: Text(
                          AppLocalizations.of(context)
                              .translate('login button text'),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      onPressed: validateLoginSubmission,
                    ),
                    minWidth: 200,
                  ),
                  SizedBox(height: 20.0),
                  ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      // child: Text(AppLocalizations.of(context).translate('sign-up button text')),
                      padding: EdgeInsets.all(15),
                      child: Text("Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      onPressed: validateSignUpSubmission,
                      color: Colors.blue,
                    ),
                  )
                ]))));
  }

  void validateLoginSubmission() async {
    // save the input fields
    final form = _formKey.currentState;
    form.save();

    if (form.validate()) {
      try {
        FirebaseUser result = await Provider.of<AuthService>(context)
            .loginUser(email: _email, password: _password);
        print(result);
        // Jump into the questionnaire
        Navigator.pushNamed(context, 'first-question');
      } on AuthException catch (error) {
        // handle the firebase specific error
        return _buildErrorDialog(context, error.message);
      } on Exception catch (error) {
        // gracefully handle anything else that might happen..
        return _buildErrorDialog(context, error.toString());
      }
    }
  }

  void validateSignUpSubmission() async {
    // save the input fields
    final form = _formKey.currentState;
    form.save();

    if (form.validate()) {
      try {
        FirebaseUser result = await Provider.of<AuthService>(context)
            .createUser(email: _email, password: _password);
        print(result);
        // Jump into the questionnaire
        Navigator.pushNamed(context, 'first-question');
      } on AuthException catch (error) {
        // handle the firebase specific error
        return _buildErrorDialog(context, error.message);
      } on Exception catch (error) {
        // gracefully handle anything else that might happen..
        return _buildErrorDialog(context, error.toString());
      }
    }
  }

  _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          // title: Text(AppLocalizations.of(context).translate('error message')),
          title: Text("Error"),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                // child: Text(AppLocalizations.of(context).translate('cancel')),
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
