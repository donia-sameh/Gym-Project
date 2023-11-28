// ignore_for_file: unnecessary_string_interpolations, unnecessary_null_comparison, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:gym_project/globals/globals.dart';
import 'package:gym_project/models/user.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/successfullbooking.dart';
import 'package:gym_project/services/databaseService.dart';
import 'package:gym_project/shared/customWidgets/CustomTextField.dart';
import 'package:gym_project/shared/customWidgets/Custom_buttom.dart';
import '../../../shared/styles/defaultStyles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DatabaseService _db = DatabaseService();
  int? userId = Globals.getUserId();
  late User userData;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  late String firstName;
  late String lastName;
  late String email;
  late String phoneNumber;

  @override
  void initState() {
    super.initState();
    getUserData(userId);
  }

  getUserData(int? id) async {
    var userMap = await _db.readData('''
        select * from user
        where userId = $id
    ''');
    userData = User.fromMap(userMap[0]);
    print(userData.paymentType);

    setState(() {
      firstNameController.text = userData.firstName;
      lastNameController.text = userData.lastName;
      emailController.text = userData.email;
      phoneNumberController.text = userData.phoneNumber;
    });

    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Profile Settings",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 0,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(55, 40, 50, 10),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/planetLogo.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            name: 'First Name',
            width: MediaQuery.of(context).size.width,
            obscureText: false,
            hintText: '',
            controller: firstNameController,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            name: 'Last Name',
            width: MediaQuery.of(context).size.width,
            obscureText: false,
            hintText: '',
            controller: lastNameController,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            name: 'Email ',
            width: MediaQuery.of(context).size.width,
            obscureText: false,
            hintText: '',
            controller: emailController,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            name: 'Phone Number',
            width: MediaQuery.of(context).size.width,
            obscureText: false,
            hintText: '',
            controller: phoneNumberController,
          ),
          SizedBox(
            height: 35,
          ),
          CustomButtom(
            text: 'Save Changes',
            width: MediaQuery.of(context).size.width,
            pressed: (() async {
              userData.firstName = firstNameController.text.trim();
              userData.lastName = lastNameController.text.trim();
              userData.email = emailController.text.trim();
              userData.phoneNumber = phoneNumberController.text.trim();

              int response = await _db.updateUserData(userData);

              /* print("$firstName : $lastName : $email : $phoneNumber"); */

              if (response == userData.userId) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    content: Text(
                      "Data Saved",
                      style: titleStyle.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      CustomButtom(
                          text: 'Ok',
                          width: MediaQuery.of(context).size.width,
                          pressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                );
              }
            }),
          )
        ],
      ),
    )));
  }
}
