import 'package:flutter/material.dart';

class BrandDrawer extends StatelessWidget {
  const BrandDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            )),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.blueAccent,
                                  size: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 0.0),
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text('Nguyen Tien Long'),
                            ),
                            Container(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '+380937941486',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('My trips'),
              leading: IconButton(
                  icon: Icon(Icons.directions_car, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            ListTile(
              title: Text('My adress'),
              leading: IconButton(
                  icon: Icon(Icons.add_location, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            ListTile(
              title: Text('Payment cards'),
              leading: IconButton(
                  icon: Icon(Icons.payment, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            ListTile(
              title: Text('Spent money'),
              leading: IconButton(
                  icon: Icon(Icons.monetization_on, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            ListTile(
              title: Text('Promotional codes'),
              leading: IconButton(
                  icon: Icon(Icons.code, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            ListTile(
              title: Text('Support'),
              leading: IconButton(
                  icon: Icon(Icons.accessibility, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            ListTile(
              title: Text('Rate a product'),
              leading: IconButton(
                  icon: Icon(Icons.rate_review, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            ListTile(
              title: Text('Settings'),
              leading: IconButton(
                  icon: Icon(Icons.settings, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Container(
              color: Colors.greenAccent,
              padding: EdgeInsets.symmetric(vertical: 21, horizontal: 15),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Bonuses',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: IconButton(
                    icon: Icon(Icons.cake, color: Colors.blueAccent),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
