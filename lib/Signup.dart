import 'package:flutter/material.dart';
import 'package:project_roshni/Feedbackform.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignUpState();
}

enum FormType { signup }

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final TextEditingController _aadharFilter = new TextEditingController();
  String _aadhar = "";
  _SignUpState() {
    _aadharFilter.addListener(_aadharListen);
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceIn);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  void _aadharListen() {
    if (_aadharFilter.text.isEmpty) {
      _aadhar = "";
    } else {
      _aadhar = _aadharFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Stack(fit: StackFit.expand, children: <Widget>[
          new Image(
            image: new AssetImage("assets/tower7.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            padding: EdgeInsets.only(top: 70.0),
            child: new ListView(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset("assets/logo.png"),
                  radius: 40.0,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                new Form(
                  autovalidate: true,
                  child: Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.teal, fontSize: 20.0))),
                    child: Container(
                      padding: const EdgeInsets.all(39.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            maxLength: 12,
                            maxLengthEnforced: true,
                            controller: _aadharFilter,
                            validator: (val) =>
                                val.length < 12 ? 'Number too short.' : null,
                            onSaved: (val) => _aadhar = val,
                            decoration: new InputDecoration(
                              hintText: "You can only enter 12 digits here",
                              labelText: "Enter Aadhar Card Number",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          _buildButtons(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Sign Up'),
            onPressed: _signupPressed,
          ),
        ],
      ),
    );
  }

  void _signupPressed() {
   int len = _aadhar.length;
     if (_aadhar == "" || len<12) {
     _fullaadhar();
    } else {
     _accountcreated();
      print('The user wants to signup with $_aadhar');
    }
  }
  void _fullaadhar() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Incomplete!!"),
            content: new Text("Write full aadhar number. "),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _accountcreated() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Done!!"),
            content: new Text("New Account Created "),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Feedbackform()));
                },
              ),
            ],
          );
        });
  }
}
