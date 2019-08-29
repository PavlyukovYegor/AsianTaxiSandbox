import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;
  final int shadowLevel;
  final bool shadowEnabled;

  BrandCard({
    this.child,
    this.padding,
    this.color = Colors.white,
    this.shadowEnabled = true,
    this.shadowLevel = 25,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: shadowEnabled ? [
            BoxShadow(
                blurRadius: 32.0,
                offset: Offset(0.0, 8.0),
                color: Colors.grey[600].withAlpha(shadowLevel))
          ] : null
      ),
      padding: padding,
      child: child,
    );
  }
}
