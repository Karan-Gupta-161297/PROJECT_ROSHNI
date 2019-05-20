import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/tower1.jpg"),
          fit: BoxFit.cover,
          color: Colors.black54,
          colorBlendMode: BlendMode.darken,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            child: new ListView(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset("assets/logo.png"),
                  radius: 40.0,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                ),
                Container(
                    padding: new EdgeInsets.all(10.0),
                    child: new Card(
                        color: Colors.black12,
                        child: new Text(
                          "CONTACT US",
                          style: new TextStyle(
                            fontSize: 30.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ))),
                Container(
                  padding: new EdgeInsets.all(10.0),
                  child: new Card(
                    color: Colors.black12,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black12))),
                            child: Icon(Icons.mail, color: Colors.white),
                          ),
                          title: Text(
                            "kanakavn98@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                          subtitle: Row(
                            children: <Widget>[
                              Icon(Icons.phone, color: Colors.blueAccent),
                              Text(" 8745005692",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black12))),
                            child: Icon(Icons.mail, color: Colors.white),
                          ),
                          title: Text(
                            "karangupta30894@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                          subtitle: Row(
                            children: <Widget>[
                              Icon(Icons.phone, color: Colors.blueAccent),
                              Text("8802030519",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black12))),
                            child: Icon(Icons.mail, color: Colors.white),
                          ),
                          title: Text(
                            "kartikaylycan@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                          subtitle: Row(
                            children: <Widget>[
                              Icon(Icons.phone, color: Colors.blueAccent),
                              Text("9810271544",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
