import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_project/screens/admin_screen/popups/createClass.dart';
import 'package:gym_project/screens/admin_screen/popups/Createcoach.dart';
import 'package:gym_project/screens/admin_screen/popups/deleteClass.dart';
import 'package:gym_project/screens/loginscreen/login_screen.dart';
import 'package:gym_project/services/databaseService.dart';
import 'package:gym_project/shared/customWidgets/CustomTextField.dart';
import 'package:gym_project/shared/customWidgets/custom_app_bar.dart';
import '../../../shared/styles/defaultStyles.dart';

import '../../shared/customWidgets/Custom_buttom.dart';
import '../SignupScreen/signup_screen.dart';

class AdminScreens extends StatelessWidget {
    final DatabaseHelper dbHelper = DatabaseHelper();
  AdminScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0x1E1E1E),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                userName: 'clerk', description: 'have a nice day in our app'),
            SizedBox(
              height: 20,
            ),
            Text('operations that you have', style: titleStyle),
            SizedBox(
              height: 30,
            ),
            CustomButtom(
              text: 'create new class',
              width: 350,
              pressed: (() {
                showDialog(
                    context: context, builder: (context) => CreateClass());
              }),
            ),
            SizedBox(height: 20),
            CustomButtom(
              text: 'delete class ',
              width: 350,
              pressed: (() {
                showDialog(
                  context: context,
                  builder: (context) => DeleteClass(),
                );
              }),
            ),
            SizedBox(height: 20),
            CustomButtom(
              text: 'create coach account ',
              width: 350,
              pressed: ((() {
                showDialog(
                  context: context,
                  builder: (context) => CreateCoach(),
                );
              })),
            ),
            SizedBox(height: 20),

        
              CustomButtom(
              text: 'Sign Out',
              pressed: () async {
                await dbHelper.deleteDatabaseFile();
                // Navigate to the login or home screen after sign-out if needed
                Navigator.pushReplacementNamed(context, '/login');
  }, width: 350),
          
        ]),
      )),
    );
  }
}
