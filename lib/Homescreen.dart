import 'package:flutter/material.dart';
import 'package:project_roshni/AboutUs.dart';
import 'package:project_roshni/ContactUs.dart';
import 'package:project_roshni/NewPage.dart';
import 'package:project_roshni/main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_roshni/Previousfeedback.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Material MyItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 15.0,
                      )),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Roshni',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Previousfeedback()));
                    },
                    child: MyItems(
                        Icons.feedback, "Your Previous Feedback", 0xffed622b)),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  NewPage("View Report Status")));
                    },
                    child: MyItems(Icons.report_problem, "View Report Status",
                        0xff26cb3c)),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    },
                    child:
                        MyItems(Icons.notifications, "Contact Us", 0xffff3266)),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: MyItems(Icons.info_outline, "About Us", 0xff3399fe)),
              ],
              staggeredTiles: [
                StaggeredTile.extent(2, 130.0),
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(2, 130.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(140, 490, 100, 25),
            child: Container(
              child: new RaisedButton(
                child: new Text('Log Out'),
                onPressed: _logoutpressed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  

  void _logoutpressed() {
    Navigator.of(context).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
