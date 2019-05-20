import 'package:flutter/material.dart';
import 'package:project_roshni/Homescreen.dart';
import 'feedback_data.dart';

List<FeedbackData> feedback = new List<FeedbackData>();

class Feedbackform extends StatefulWidget {
  @override
  _FeedbackformState createState() => _FeedbackformState();
}

enum FormType { submit, homepage }

class _FeedbackformState extends State<Feedbackform> {
  FeedbackData data;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _localityFilter = new TextEditingController();
  final TextEditingController _cityFilter = new TextEditingController();
  final TextEditingController _stateFilter = new TextEditingController();

  final TextEditingController _durationFilter = new TextEditingController();

  final TextEditingController _issuesFilter = new TextEditingController();

  String _locality = "";
  String _city = "";
  String _state = "";
  String _duration = "";
  String _issues = "";
  FormType _form = FormType
      .submit; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _FeedbackformState() {
    _localityFilter.addListener(_localityListen);
    _cityFilter.addListener(_cityListen);
    _stateFilter.addListener(_stateListen);
    _durationFilter.addListener(_durationListen);
    _issuesFilter.addListener(_issuesListen);
  }

  void _localityListen() {
    if (_localityFilter.text.isEmpty) {
      _locality = "";
    } else {
      _locality = _localityFilter.text;
    }
  }

  void _cityListen() {
    if (_cityFilter.text.isEmpty) {
      _city = "";
    } else {
      _city = _cityFilter.text;
    }
  }

  void _stateListen() {
    if (_stateFilter.text.isEmpty) {
      _state = "";
    } else {
      _state = _stateFilter.text;
    }
  }

  void _durationListen() {
    if (_durationFilter.text.isEmpty) {
      _duration = "";
    } else {
      _duration = _durationFilter.text;
    }
  }

  void _issuesListen() {
    if (_issuesFilter.text.isEmpty) {
      _issues = "";
    } else {
      _issues = _issuesFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.homepage) {
        _form = FormType.submit;
      } else {
        _form = FormType.homepage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              _buildTextFields(),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Feedback Form",
          style: new TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontSize: 25.0,
              fontWeight: FontWeight.bold)),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new TextField(
                controller: _localityFilter,
                decoration: new InputDecoration(labelText: ' Enter Locality'),
                keyboardType: TextInputType.text,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _cityFilter,
                decoration: new InputDecoration(labelText: ' Enter City'),
                keyboardType: TextInputType.text,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _stateFilter,
                decoration: new InputDecoration(labelText: ' Enter State'),
                keyboardType: TextInputType.text,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _durationFilter,
                maxLength: 2,
                maxLengthEnforced: true,
                decoration:
                    new InputDecoration(labelText: ' Enter Duration(in hours)'),
                keyboardType: TextInputType.number,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _issuesFilter,
                decoration: new InputDecoration(labelText: 'Any other issues'),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.submit) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: new Container(
          child: new Column(
            children: <Widget>[
              new RaisedButton(
                child: new Text('Submit'),
                onPressed: _submitPressed,
              ),
              new FlatButton(
                child: new Text(
                    'Feedback submitted? Tap here to go to homepage.',
                    textAlign: TextAlign.center),
                onPressed: _formChange,
              ),
            ],
          ),
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('HomePage'),
              onPressed: _homepagePressed,
            ),
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _submitPressed() {
    if (_locality == "" || _city == "" || _state == "" || _duration == "") {
      _fillfullform();
    } else {
      _showDialog();
      print('The user has given a feedback ');
      data = new FeedbackData(_locality, _city, _state, _duration, _issues);
      feedback.add(data);
      setState(() {
        _localityFilter.text = "";
        _cityFilter.text = "";
        _stateFilter.text = "";
        _durationFilter.text = "";
        _issuesFilter.text = "";
      });
    }
  }

  void _homepagePressed() {
    if (_locality == "" ||
        _city == "" ||
        _state == "" ||
        _duration == "" ||
        _issues == "") {
      _showFeedbackDialog();
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homescreen()));
    }
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Form Submitted"),
            content: new Text("You have successfully submitted the feedback"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                },
              ),
            ],
          );
        });
  }

  void _showFeedbackDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Warning"),
            content: new Text("Fill the feedback form first"),
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

  void _fillfullform() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Incomplete!!"),
            content: new Text("Fill the full feedback form. "),
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
