import 'package:flutter/material.dart';
import 'package:gym_project/models/coach.dart';

import '../../../shared/customWidgets/Custom_buttom.dart';
import '../../../shared/styles/defaultStyles.dart';

class CoachInfo extends StatefulWidget {
  const CoachInfo({super.key});

  @override
  State<CoachInfo> createState() => _CoachInfoState();
}

class _CoachInfoState extends State<CoachInfo> {
  @override
  Widget build(BuildContext context) {
    final Coach coachArgs = ModalRoute.of(context)!.settings.arguments as Coach;
    return Scaffold(
      backgroundColor: Color(0xff0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButtom(
                        buttonIcon: Icon(Icons.chevron_left),
                        width: 50,
                        pressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 75),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            coachArgs.firstName,
                            style: titleStyle.copyWith(fontSize: 18),
                          ),
                          Text(
                            "Overview",
                            style: titleStyle.copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/coach-girl.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Coach's Description",
                          style: titleStyle.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      coachArgs.phoneNumber,
                      style: TextStyle(color: Color(0xFF827979)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Classes That is Involved In : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Text(
                            "Boxing",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Text(
                            "Yoga",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
