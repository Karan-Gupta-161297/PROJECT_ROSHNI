import 'package:flutter/material.dart';
import 'package:project_roshni/Feedbackform.dart';
import 'dart:async';
import 'package:project_roshni/Signup.dart';

void main() => runApp(MaterialApp(
      title: 'Roshni',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: appTheme,
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage()
      },
    ));

ThemeData appTheme =
    ThemeData(primaryColor: Colors.grey[700], fontFamily: 'Oxygen');

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginPage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/tower3.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: Image.asset('assets/logo.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final TextEditingController _aadharFilter = new TextEditingController();
  String _aadhar = "";
  FormType _form = FormType.login;
  _LoginPageState() {
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

  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
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
    if (_form == FormType.login && _aadhar != null) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
            new FlatButton(
              child: new Text(
                'Dont have an account? Tap here to register.',
                textAlign: TextAlign.center,
              ),
              onPressed: _formChange,
            ),
           
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  void _loginPressed() {
    int len=_aadhar.length;
    if (_aadhar == "" || len<12) {
       _fullaadhar();
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feedbackform()));
      print('The user wants to login with $_aadhar');
    }

  }

  void _createAccountPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
    print('The user wants to create an account with $_aadhar');
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

}
