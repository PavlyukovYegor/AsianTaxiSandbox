import 'package:flutter/material.dart';

class MyCustomBottomBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomBottomBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.looks_one),
              title: Text('Red'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.looks_two),
              title: Text("Blue"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.looks_3),
              title: Text('Green'),
            )
          ]
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}