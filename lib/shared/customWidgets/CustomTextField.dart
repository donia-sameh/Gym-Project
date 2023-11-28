import 'package:flutter/material.dart';

import '../../../shared/styles/defaultStyles.dart';
import '../styles/defaultStyles.dart';

class CustomTextField extends StatelessWidget {
  double width;
  String? name;
  bool obscureText;
  String hintText;
  TextEditingController? controller;
  Color? colortext;
  late void Function()? validate;

  CustomTextField({
    required this.name,
    required this.width,
    required this.obscureText,
    required this.hintText,
    this.controller,
    this.colortext,
    Key? key,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$name",
          style: hintStyle.copyWith(color: colortext),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width,
          height: 45,
          child: TextField(
            controller: controller,
            style: TextStyle(
                fontSize: 13,
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal),
            obscureText: obscureText,
            decoration: InputDecoration(
              border: textFieldBorder,
              filled: true,
              fillColor: Colors.white,
              hintText: "$hintText",
            ),
          ),
        )
      ],
    );
  }
}
