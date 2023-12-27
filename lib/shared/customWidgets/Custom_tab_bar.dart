import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  String classTag;
  late Function() pressed;
  CustomTabBar({
    required this.classTag,
    required this.pressed,
    super.key,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.pressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff0D0D0D),
          border: Border.all(width: 1, color: Colors.white),
        ),
        child: Text(
          widget.classTag,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
