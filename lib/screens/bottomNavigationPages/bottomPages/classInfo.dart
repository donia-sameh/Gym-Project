import 'package:flutter/material.dart';
import 'package:phone_auth/globals/globals.dart';
import 'package:phone_auth/models/Class.dart';
import 'package:phone_auth/screens/videoup/video.dart';

import '../../../models/user.dart';
import '../../../services/databaseService.dart';
import '../../../shared/customWidgets/Custom_buttom.dart';
import '../../../shared/styles/defaultStyles.dart';

class ClassInfo extends StatefulWidget {
  ClassInfo({
    super.key,
  });

  @override
  State<ClassInfo> createState() => _ClassInfoState();
}

class _ClassInfoState extends State<ClassInfo> {
  String? paymentType = 'visa';
  DatabaseService _db = DatabaseService();
  int? userId = Globals.getUserId();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Class classArgs = ModalRoute.of(context)!.settings.arguments as Class;
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
                            classArgs.className,
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
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // image: const DecorationImage(
                          //   image: AssetImage("assets/girl-box.png"),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: const VideoPage(),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Class Description",
                          style: titleStyle.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Level:",
                                  style: titleStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: "  ${classArgs.classLevel}",
                                style: titleStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF827979),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      classArgs.classDescription,
                      style: TextStyle(color: Color(0xFF827979)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Duration",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          ":  ${classArgs.duration} minutes",
                          style: TextStyle(
                            color: Color(0xFF827979),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Class Needs : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Text(
                        "Weight",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Coach : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Text(
                        "Habeba",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Row(
                  children: [
                    CustomButtom(
                      text: "Schedule A Class",
                      width: 250,
                      pressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Choose A Payment"),
                            content: Expanded(
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return SizedBox(
                                    height: 115,
                                    child: Column(
                                      children: [
                                        RadioListTile(
                                          title: const Text("Visa"),
                                          value: "visa",
                                          groupValue: paymentType,
                                          activeColor: crBlack,
                                          onChanged: (value) {
                                            setState(() {
                                              paymentType = value
                                                  .toString()
                                                  .toLowerCase();
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          title: const Text("Cash"),
                                          value: "cash",
                                          groupValue: paymentType,
                                          activeColor: crBlack,
                                          onChanged: (value) {
                                            setState(() {
                                              paymentType = value
                                                  .toString()
                                                  .toLowerCase();
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            actions: [
                              CustomButtom(
                                  text: "Schedule",
                                  width: MediaQuery.of(context).size.width,
                                  pressed: () async {
                                    int response = await _db.updatePaymentType(
                                      paymentType,
                                      userId,
                                    );

                                    if (response == userId) {
                                      Navigator.pushNamed(
                                        context,
                                        '/home/classInfo/success',
                                        arguments: {
                                          "className": classArgs.className
                                        },
                                      );
                                    }
                                  })
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 20),
                    Text(
                      "${classArgs.pricePerClass}\$",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /*  img: "assets/girl-box.png", */
    );
  }
}
