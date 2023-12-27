import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../../shared/styles/defaultStyles.dart';
import '../styles/defaultStyles.dart';

class CustomButtom extends StatelessWidget {
  String? text;
  double width;
  final Function() pressed;
  Icon? buttonIcon;
  CustomButtom({
    this.text,
    required this.width,
    required this.pressed,
    Key? key,
    this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffD4F11D),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: crBlack.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
            BoxShadow(
              color: crBlack.withOpacity(0.10),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          // ignore: prefer_if_null_operators
          child: buttonIcon != null
              ? buttonIcon
              : Text(
                  '$text',
                  style: hintStyle.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
