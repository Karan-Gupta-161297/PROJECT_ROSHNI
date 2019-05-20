import 'package:flutter/material.dart';
import 'Feedbackform.dart';

class Previousfeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Previous Feedback",
            style: new TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: feedback.length,
        itemBuilder: (context, int index) {
          return _customCard(index, context);
        },
      ),
    );
  }
}

Widget _customCard(int index, BuildContext context) {
  return Card(
    color: Colors.indigo[100],
    elevation: 4.0,
    margin: EdgeInsets.all(12.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              child: Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(feedback[index].locality,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Text(feedback[index].city + " ;" + feedback[index].state,
                        style: TextStyle(fontSize: 17.0)),
                        Text(feedback[index].other,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 19.0, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Container(
             margin: EdgeInsets.only(right: 6.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("Hour(s)", style: TextStyle(fontSize: 20.0)),
                  ),
                  Container(
                    child: Text(
                      feedback[index].duration,
                      style: TextStyle(fontSize: 40.0, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
