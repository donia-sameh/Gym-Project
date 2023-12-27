// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../shared/styles/defaultStyles.dart';

class CustomAppBar extends StatelessWidget {
  String userName;
  String description;
  CustomAppBar({
    required this.userName,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Hello, ",
                                style: titleStyle.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal)),
                            TextSpan(
                              text: "$userName",
                              style: titleStyle.copyWith(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "$description",
                        style: titleStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage("assets/planetLogo.jpg"),
                          fit: BoxFit.contain),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
