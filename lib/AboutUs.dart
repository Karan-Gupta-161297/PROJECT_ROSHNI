import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                          "ABOUT US",
                          style: new TextStyle(
                            fontSize: 30.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ))),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    padding: new EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: new Card(
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Main concern of this web/mobile app is to connect people with the concerned authorities so that appropriate actions and solutions of the problems can be implemented in the right time and no region left unhandled. It also administrates the power position in rural and urbam areas with the help of the feedback of the people so that we can use to monitor the power supply in that area ",
                            style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
