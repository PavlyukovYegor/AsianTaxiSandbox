import 'package:flutter/material.dart';


class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AppBar(
          title: Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.directions_car),
              onPressed: () {
                return null;
              }
            ),
          ],
        ),
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
